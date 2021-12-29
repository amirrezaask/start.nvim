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
You need to change "theme" for the name of the theme you want (themes are listed on THEMES.txt)
```vim
lua require'start'.set_background_ascii(require'start'.theme)
```
