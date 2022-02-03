let g:ycm_autoclose_preview_window_after_completion=1
let s:ycm_hover_popup = -1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


"python with virtualenv support
" create .ycm_extra_conf.py at root folder
" add this
"def Settings( **kwargs ):
"  return {
"    'interpreter_path': '/path/to/virtual/environment/python'
"  }

" global settings for virtualenv
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/.vim/global_extra_conf.py'

