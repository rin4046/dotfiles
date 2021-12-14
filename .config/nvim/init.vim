call plug#begin(stdpath('data') . '/plugged')
Plug 'vv9k/bogster'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'neovim/nvim-lspconfig'
call plug#end()

function Init()
  set nonumber
  set signcolumn=no
  NERDTree | wincmd p
  belowright split | terminal
  resize 14 | set winfixheight | wincmd p
  set number
  set signcolumn=yes
endfunction

let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1

set mouse=a
set termguicolors
let g:lightline = { 'colorscheme': 'bogster' }
colorscheme bogster

tnoremap <Esc> <C-\><C-n>
autocmd VimEnter * call Init()
autocmd TabNew * call Init()
autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
autocmd TermOpen * setlocal nonumber | setlocal signcolumn=no

lua << EOF
vim.diagnostic.config({ update_in_insert = true })
require'lspconfig'.clangd.setup{}
EOF
