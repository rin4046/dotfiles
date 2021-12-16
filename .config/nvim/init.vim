call plug#begin(stdpath('data') . '/plugged')
Plug 'vv9k/bogster'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'neovim/nvim-lspconfig'
call plug#end()

function! TabInit()
  set nonumber
  set signcolumn=no
  NERDTree | wincmd p
  belowright split | terminal
  resize 14 | set winfixheight | wincmd p
  set number
  set signcolumn=yes
endfunction

function! FiletypeWithIcon()
  return strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft'
endfunction

let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:lightline = {
\   'colorscheme': 'bogster',
\   'component_function': {
\     'filetype': 'FiletypeWithIcon'
\   }
\ }

set mouse=a
set termguicolors
colorscheme bogster

tnoremap <Esc> <C-\><C-n>
autocmd VimEnter * call TabInit()
autocmd TabNew * call TabInit()
autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
autocmd TermOpen * setlocal nonumber | setlocal signcolumn=no

lua << EOF
vim.diagnostic.config({ update_in_insert = true })
require'lspconfig'.clangd.setup{}
EOF
