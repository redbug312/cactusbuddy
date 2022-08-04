# Cactusbuddy

A plain succulent 256-color theme using [colorbuddy].

[colorbuddy]: https://github.com/tjdevries/colorbuddy.nvim

## Screenshots

### Rust

![cactusbuddy-rust](media/cactusbuddy-rust.png)

### JavaScript

![cactusbuddy-javascript](media/cactusbuddy-javascript.png)

### Tig

![cactusbuddy-tig](media/cactusbuddy-tig.png)

Tig configuration for the theme can be found in [the gist][tigrc].

[tigrc]: https://gist.github.com/redbug312/8a6541ddedf087c1e851d5b8ae07048d

## Installation

```vim
" Using vim-plug
Plug 'tjdevries/colorbuddy.vim'
Plug 'redbug312/cactusbuddy'
lua require('colorbuddy').colorscheme('cactusbuddy')
```

```lua
-- Using packer
use { 'redbug312/cactusbuddy', requires = 'tjdevries/colorbuddy.vim' }
require('colorbuddy').colorscheme('cactusbuddy')
```

## Use with [express_line]

[express_line]: https://github.com/tjdevries/express_line.nvim

Enable the statusline settings in screenshots.

```lua
use { 'tjdevries/express_line.nvim', requires = 'nvim-lua/plenary.nvim' }
vim.g.cactusbuddy_express_line_enabled = true
require('colorbuddy').colorscheme('cactusbuddy')
```
