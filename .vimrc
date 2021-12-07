call plug#begin('~/.vim/plugged')
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

let &t_SI.="\e[5 q"
let &t_SR.="\e[3 q"
let &t_EI.="\e[1 q"
set ttimeoutlen=10

let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1

belowright terminal ++rows=14 ++kill=hup
set winfixheight | wincmd p
set number
