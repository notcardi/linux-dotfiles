vim.cmd("set expandtab")

vim.cmd("set tabstop=4")

vim.cmd("set softtabstop=4")

vim.cmd("set shiftwidth=4")


local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('catppuccin/nvim', {['as'] = 'catppuccin'})
Plug('neoclide/coc.nvim', {['branch'] = 'release'})
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('preservim/nerdtree')
Plug('nvimdev/dashboard-nvim')
Plug('ray-x/web-tools.nvim')

vim.call('plug#end')


vim.cmd.colorscheme "catppuccin"

require('catppuccin').setup({
    flavour = "mocha"
})
require('dashboard').setup({
    theme = 'hyper'
})

require'web-tools'.setup({
  keymaps = {
    rename = nil,  -- by default use same setup of lspconfig
    repeat_rename = '.', -- . to repeat
  },
  hurl = {  -- hurl default
    show_headers = false, -- do not show http headers
    floating = false,   -- use floating windows (need guihua.lua)
    json5 = false,      -- use json5 parser require json5 treesitter
    formatters = {  -- format the result by filetype
      json = { 'jq' },
      html = { 'prettier', '--parser', 'html' },
    },
  },
})

require('lualine').setup()

vim.cmd([[
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"

nnoremap <C-f> :NERDTreeToggle<CR>

nnoremap <C-n> :NERDTreeFocus<CR>

inoremap <silent><expr> <cr> "\<c-g>u\<CR>"

let g:NERDTreeDirArrowExpandable="+"

let g:NERDTreeDirArrowCollapsible="~"
]])
