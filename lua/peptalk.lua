-- Main module for the Pep Talk Plugin
local M = {}

-- Function to print the motivational message
-- TODO : Select message from list, figure out how to show it in a popup
function M.motivate()
	print("Message goes here")
end

-- Function to set up the plugin
function M.setup(opts)
	-- Merge user options with defaults
	opts = opts or {}

	-- Create the user command
	vim.api.nvim_create_user_command("PepTalk", M.motivate, {})

	-- Set up a key mapping
	-- Use opts.keymap if provided, otherwise default to '<leader>mm'
	local keymap = opts.keymap or "<leader>mm" -- mm = motivate me

	-- Create the keymap
	vim.keymap.set("n", keymap, M.motivate, {
		desc = "Prints a motivational message",
		silent = true, -- Prevents the command from being echoed in the command line
	})
end

-- Return the module
return M
