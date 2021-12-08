call plug#begin(stdpath('data') . '/plugged')
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
call plug#end()

autocmd VimEnter * NERDTree | wincmd p
autocmd BufWritePre <buffer> LspDocumentFormatSync

let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1

tnoremap <Esc> <C-\><C-n>
belowright sp | terminal
resize 12 | set winfixheight | wincmd p
set number
