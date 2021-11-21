if &compatible
  set nocompatible
endif

let $VIM_PATH = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let $DATA_PATH =
  \ expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~/.cache') . '/vim')

for s:path in [
    \ $DATA_PATH,
    \ $DATA_PATH . '/undo',
    \ $DATA_PATH . '/backup',
    \ $DATA_PATH . '/session',
    \ $DATA_PATH . '/swap',
    \ $DATA_PATH . '/tags' ]
  if ! isdirectory(s:path)
    call mkdir(s:path, 'p')
  endif
endfor

let g:loaded_gzip = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1
let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1
" enable DoMatch
" let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:loaded_2html_plugin = 1
let g:loaded_logiPat = 1
let g:loaded_rrhelper = 1
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

let g:mapleader="\<Space>"
nnoremap <Space>  <Nop>
xnoremap <Space>  <Nop>

" load dein.vim
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $DATA_PATH . '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif


let g:dein#auto_recache = 1
let g:dein#install_max_processes = 12
let g:dein#install_progress_type = 'title'
let g:dein#enable_notification = v:true
let g:dein#install_check_diff = v:true
let g:dein#lazy_rplugins = v:true
let g:dein#install_log_filename = $DATA_PATH . '/dein.log'

let s:dein_dir = $DATA_PATH . '/dein'
let s:base_dir = fnamemodify(expand('<sfile>'), ':h') . '/modules/'
let s:dein_toml = s:base_dir . 'dein.toml'
let s:lazy_enhance = s:base_dir . 'lazy_enhance.toml'
let s:lazy_lsp = s:base_dir . 'lazy_lsp.toml'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
    call dein#load_toml(s:dein_toml, {'lazy': 0})
    call dein#load_toml(s:lazy_enhance, {'lazy' : 1})
    call dein#load_toml(s:lazy_lsp, {'lazy' : 1})
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"" Trigger source event hooks
call dein#call_hook('source')
call dein#call_hook('post_source')
