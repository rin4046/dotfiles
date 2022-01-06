vim9script

plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'vv9k/bogster'
plug#end()

set number
set signcolumn=number
set laststatus=2

colorscheme bogster
set background=dark
set guifont=PlemolJPConsoleNF-Regular:h12

command! T :vertical botright term

def g:LspErrors(): string
  var info = get(b:, 'coc_diagnostic_info', {})
  return get(info, 'error', 0) ? 'E:' .. info['error'] : ''
enddef

def g:LspWarnings(): string
  var info = get(b:, 'coc_diagnostic_info', {})
  return get(info, 'warning', 0) ? 'W:' .. info['warning'] : ''
enddef

autocmd User CocDiagnosticChange lightline#update()

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

g:coc_global_extensions = ['coc-clangd', 'coc-rls']
coc#config("diagnostic.errorSign", "E>")
coc#config("diagnostic.warningSign", "W>")
coc#config('diagnostic.refreshOnInsertMode', true)
coc#config('coc.preferences.formatOnSaveFiletypes', ['c', 'cpp', 'rust'])
