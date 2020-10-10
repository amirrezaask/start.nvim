# Start.nvim
Start.nvim helps you create a custom start screen for your neovim


# Installation
## Plug 
```vim
Plug 'amirrezaask/start.nvim'
```
## Packer
```lua
use { 'amirrezaask/start.nvim' }
```

# Configuration
```vim
lua require'start'.set_background_ascii(require'start'.neovim_is_awesome)
```
