call plug#begin(stdpath('data') . '/plugged')
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'dense-analysis/ale'
call plug#end()

tnoremap <Esc> <C-\><C-n>
autocmd VimEnter * NERDTree | wincmd p
autocmd FileType c nnoremap <buffer> <F5> :w<CR> :!gcc -std=c11 % && ./a.out<CR>

belowright sp | terminal
resize 12 | set winfixheight | wincmd p
set number

let g:NERDTreeShowHidden = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_fix_on_save = 1
let g:ale_linters = {
\ 'c': ['gcc'],
\ 'cpp': ['gcc']
\}
let g:ale_fixers = {
\ 'c': ['clang-format'],
\ 'cpp': ['clang-format']
\}
