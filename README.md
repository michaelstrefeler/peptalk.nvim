# peptalk.nvim

Need a pep talk while programming with NeoVim? This is the plugin for you!

> Inspired by the Halls cough drops "A Pep Talk in Every Drop" campaign

## Installation

 - Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "michaelstrefeler/peptalk.nvim",
  -- Default config is shown
  opts = {
      messages_file = "path/to/your/messages.csv" -- Optional: override of messages file
      keymap_print = "<leader>mm" -- mm = motivate me
      keymap_popup = "<leader>mM"
    }
}
```
Or, if you use one file per plugin (like me):

```lua
return {
  "michaelstrefeler/peptalk.nvim",
  opts = {
      messages_file = "path/to/your/messages.csv"
      keymap_print = "<leader>mm"
      keymap_popup = "<leader>mM"
    }
}
```
- Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
    'michaelstrefeler/peptalk.nvim',
    config = function()
        require('peptalk').setup()
    end
}
```
- Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'michaelstrefeler/peptalk.nvim'
```

## Usage

After installation:
1. Run `:PepTalk` to print a motivational message (as a notification) or `:PepTalkPopup` to open a message as a popup (in a small window)
2. Or use either one of the keymaps (by default `<leader>mm` and `<leader>mM` respectively)
3. Return to coding invigorated by the motivational message that you just read!
