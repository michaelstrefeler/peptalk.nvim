-- Main module for the Pep Talk Plugin
local M = {}

-- Table to store motivational messages
M.messages = {}

-- Load messages from the file at file_path
function M.load_messages(file_path)
	-- Add plugin_dir to default path
	if file_path == "../data/messages.csv" then
		local plugin_dir = debug.getinfo(1, "S").source:match("@(.*/)") or "./"
		file_path = plugin_dir .. file_path
	end

	local file = io.open(file_path, "r")
	if not file then
		vim.notify("Failed to load messages file: " .. file_path, vim.log.levels.ERROR)
		return
	end

	-- Clear existing messages
	M.messages = {}

	-- Read lines from the file and store them in the messages table
	for line in file:lines() do
		if line and line ~= "" then
			table.insert(M.messages, line)
		end
	end

	file:close()
end

-- Wrap text so it fits the space better
local function wrap_text(text, width)
	local lines = {}
	for line in text:gmatch("[^\n]+") do
		local current_line = ""
		for word in line:gmatch("%S+") do
			if #current_line + #word + 1 > width then
				table.insert(lines, current_line)
				current_line = word
			else
				current_line = current_line == "" and word or current_line .. " " .. word
			end
		end
		if current_line ~= "" then
			table.insert(lines, current_line)
		end
	end
	return lines
end

-- Display the motivational message in a popup
function M.motivate()
	if #M.messages == 0 then
		vim.notify("No motivational messages loaded!", vim.log.levels.WARN)
		return
	end

	local message = M.messages[math.random(#M.messages)]

	local width = 80

	-- Wrap the message
	local wrapped_message = wrap_text(message, width)
	wrapped_message[1] = " " .. wrapped_message[1]

	-- Define the popup window options
	local buf = vim.api.nvim_create_buf(false, true) -- Create a scratch buffer
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, wrapped_message)

	local win_width = nil
	if #message < width then
		win_width = #message + 4
	else
		win_width = width + 4
	end
	local win_height = 3

	local row = math.floor((vim.o.lines - win_height) / 2)
	local col = math.floor((vim.o.columns - win_width) / 2)

	local win_id = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = win_width,
		height = win_height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	})

	-- Close the popup automatically after a short delay
	vim.defer_fn(function()
		vim.api.nvim_win_close(win_id, true)
		vim.api.nvim_buf_delete(buf, { force = true })
	end, 5000) -- 5000 ms = 5 seconds
end

-- Set up the plugin
function M.setup(opts)
	opts = opts or {}

	-- Load messages from the provided file path
	local file_path = opts.messages_file or "../data/messages.csv"
	M.load_messages(file_path)

	-- Set up key mappings
	local keymap = opts.keymap or "<leader>mm" -- mm = motivate me

	-- Create user commands
	vim.api.nvim_create_user_command("PepTalk", M.motivate, {})

	-- Create key mapping
	vim.keymap.set("n", keymap, M.motivate, {
		desc = "Show a motivational message in a popup",
		silent = true,
	})
end

-- Return the module
return M
