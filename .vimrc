vim9script

plug#begin('~/.vim/plugged')
if system('hostname')[ : 3] != 'xdev'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'vv9k/bogster'
plug#end()

set backspace=indent,eol,start
set number
set signcolumn=number
set laststatus=2
set termguicolors
set background=dark
colorscheme bogster

autocmd GUIEnter * {
  if has('mac')
    set guifont=PlemolJPConsoleNF-Regular:h12
  endif
  autocmd VimEnter * terminal ++curwin
}
autocmd WinNew * wincmd L
autocmd User CocDiagnosticChange lightline#update()

def g:Tapi_vimcd(buf: number, path: string)
  execute 'tcd ' .. path
  pwd
enddef

def g:LspErrors(): string
  var info = get(b:, 'coc_diagnostic_info', {})
  return get(info, 'error', 0) ? 'E:' .. info['error'] : ''
enddef

def g:LspWarnings(): string
  var info = get(b:, 'coc_diagnostic_info', {})
  return get(info, 'warning', 0) ? 'W:' .. info['warning'] : ''
enddef

g:lightline = {
  'colorscheme': 'bogster',
  'active': {
    'right': [
      ['lsp_warnings', 'lsp_errors'],
      ['lineinfo'],
      ['fileformat', 'fileencoding']
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

g:coc_global_extensions = ['coc-clangd', 'coc-rls', '@yaegassy/coc-volar']
coc#config('diagnostic.errorSign', 'E>')
coc#config('diagnostic.warningSign', 'W>')
coc#config('diagnostic.refreshOnInsertMode', true)
coc#config('coc.preferences.formatOnSaveFiletypes', ['c', 'cpp', 'rust', 'vue'])
