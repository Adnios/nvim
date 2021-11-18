" Set main configuration directory as parent directory
let $VIM_PATH = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let $DATA_PATH =
  \ expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~/.cache') . '/vim')

lua require('domain.core')
