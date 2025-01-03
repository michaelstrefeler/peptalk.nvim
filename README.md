# peptalk.nvim

Need a pep talk while programming with NeoVim? This is the plugin for you!

Get motivation right in NeoVim in the form of a message in a notification or a popup (and then get back to coding)!

Disclaimer : I found most of these "motivational message" online and do not claim to be the muse behind any of them. 

> Inspired by the Halls cough drops "A Pep Talk in Every Drop" campaign

## Installation

 - Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "michaelstrefeler/peptalk.nvim",
  opts = {
      messages_file = "path/to/your/messages.csv" -- Optional: override of messages file
      keymap = "<leader>mm" -- Default keymap
  }
}
```
Or, if you use one file per plugin (like me):

```lua
return {
  "michaelstrefeler/peptalk.nvim",
  opts = {
      messages_file = "path/to/your/messages.csv" -- Optional: override of messages file
      keymap = "<leader>mm" -- Default keymap
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
1. Run `:PepTalk` to print a motivational message (in a small window)
2. Or use the keymap (by default `<leader>mm`)
3. Return to coding invigorated by the motivational message that you just read!
