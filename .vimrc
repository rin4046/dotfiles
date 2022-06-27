vim9script

plug#begin('~/.vim/plugged')
Plug 'vv9k/bogster'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
plug#end()

set backspace=indent,eol,start
set number
set laststatus=2
set termguicolors
set background=dark
colorscheme bogster

g:lsp_diagnostics_echo_cursor = 1
g:lightline = {
  'colorscheme': 'bogster',
  'active': {
    'right': [
      ['lsp_warnings', 'lsp_errors'],
      ['lineinfo'],
      ['fileencoding', 'filetype']
    ]
  },
  'component_expand': {
    'lsp_errors': 'LspErrors',
    'lsp_warnings': 'LspWarnings'
  },
  'component_type': {
    'lsp_errors': 'error',
    'lsp_warnings': 'warning'
  }
}

def g:Tapi_vimcd(buf: number, path: string)
  execute 'tcd ' .. path
  pwd
enddef

def g:LspErrors(): string
  var counts = lsp#get_buffer_diagnostics_counts()
  return counts.error > 0 ? 'E:' .. counts.error : ''
enddef

def g:LspWarnings(): string
  var counts = lsp#get_buffer_diagnostics_counts()
  return counts.warning > 0 ? 'W:' .. counts.warning : ''
enddef

def LspBufferEnabled()
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes

  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> K <plug>(lsp-hover)

  autocmd! BufWritePre <buffer> LspDocumentFormatSync
  autocmd! User lsp_diagnostics_updated lightline#update()
enddef

augroup vim_setup
  au!
  autocmd GUIEnter * {
    set guifont=PlemolJPConsoleNF-Regular:h12
    if @% == '' && wordcount().chars == 0
      terminal ++curwin
    endif
    set macmeta
  }
  autocmd WinNew * wincmd L
  autocmd User lsp_buffer_enabled LspBufferEnabled()
augroup END

if $HOSTNAME =~ "^xdev[0-9][0-9]\.edu\.tut\.ac\.jp$"
  noremap  ÷ <C-w>w
  inoremap ÷ <Esc><C-w>w
  tnoremap ÷ <C-\><C-n><C-w>w

  noremap  è <C-w>h
  inoremap è <Esc><C-w>h
  tnoremap è <C-\><C-n><C-w>h

  noremap  ê <C-w>j
  inoremap ê <Esc><C-w>j
  tnoremap ê <C-\><C-n><C-w>j

  noremap  ë <C-w>k
  inoremap ë <Esc><C-w>k
  tnoremap ë <C-\><C-n><C-w>k

  noremap  ì <C-w>l
  inoremap ì <Esc><C-w>l
  tnoremap ì <C-\><C-n><C-w>l
endif

# AtCoder のための設定
def g:ForAtCoder()
  var command = 'cd ' .. expand('%:p:h') .. ' && make SRC="' .. expand('%:t') .. '"'
  update
  execute 'terminal ++shell' command
enddef

augroup atcoder
  au!
  autocmd BufEnter */atcoder/* nnoremap <buffer> <F5> :call ForAtCoder()<CR>
augroup END
