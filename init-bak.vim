" Set main configuration directory as parent directory
let $VIM_PATH =
	\ get(g:, 'etc_vim_path',
	\   exists('*stdpath') ? stdpath('config') :
	\   ! empty($MYVIMRC) ? fnamemodify(expand($MYVIMRC, 1), ':h') :
	\   ! empty($VIM_PATH) ? expand($VIM_PATH, 1) :
	\   fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
	\ )

let $VIM_DATA_PATH = exists('*stdpath') ? stdpath('data') :
	\ expand(($XDG_DATA_HOME ? $XDG_DATA_HOME : '~/.local/share') . '/nvim', 1)

"" Collection of user plugin list config file-paths
let s:config_paths = get(g:, 'etc_config_paths', [
	\ $VIM_PATH . '/modules/addon.yaml',
	\ ])
	" \ $VIM_PATH . '/modules/appearance.yaml',
	" \ $VIM_PATH . '/modules/coding.yaml',
	" \ $VIM_PATH . '/modules/enhance.yaml',
	" \ $VIM_PATH . '/modules/fuzzyfind.yaml',
	" \ $VIM_PATH . '/modules/textobj.yaml',
	" \ $VIM_PATH . '/modules/tools.yaml',
	" \ $VIM_PATH . '/modules/treesitter.yaml',
	" \ $VIM_PATH . '/modules/writing.yaml',

" Use dein as a plugin manager
function! s:use_dein()
	let l:cache_path = $VIM_DATA_PATH . '/dein'

	if has('vim_starting')
		let g:dein#auto_recache = v:true
		" let g:dein#lazy_rplugins = v:true
		let g:dein#install_progress_type = 'echo'
		let g:dein#install_message_type = 'echo'
		let g:dein#install_max_processes = 10
		let g:dein#enable_notification = v:true

		" Add dein to vim's runtimepath
		if &runtimepath !~# '/dein.vim'
			let s:dein_dir = l:cache_path . '/repos/github.com/Shougo/dein.vim'
			" Clone dein if first-time setup
			if ! isdirectory(s:dein_dir)
				execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
				if v:shell_error
					call s:error('dein installation has failed! is git installed?')
					finish
				endif
			endif

			execute 'set runtimepath+='.substitute(
				\ fnamemodify(s:dein_dir, ':p') , '/$', '', '')
		endif
	endif

	" Initialize dein.vim (package manager)
	if dein#load_state(l:cache_path)
		let l:rc = s:parse_config_files()
		if empty(l:rc)
			call s:error('Empty plugin list')
			return
		endif

		" Start propagating file paths and plugin presets
		call dein#begin(l:cache_path, extend([expand('<sfile>')], s:config_paths))

		for plugin in l:rc
			" If vim already started, don't re-add existing ones
			if has('vim_starting')
					\ || ! has_key(g:dein#_plugins, fnamemodify(plugin['repo'], ':t'))
				call dein#add(plugin['repo'], extend(plugin, {}, 'keep'))
			endif
		endfor

		call dein#end()

		" Save cached state for faster startups
		if ! g:dein#_is_sudo
			call dein#save_state()
		endif

		" Update or install plugins if a change detected
		if dein#check_install()
			call dein#install()
		endif
	endif

	filetype plugin indent on
	syntax enable
endfunction

function! s:parse_config_files()
	let l:merged = []
	try
		" Merge all lists of plugins together
		for l:cfg_file in s:config_paths
			let l:merged = extend(l:merged, s:load_config(l:cfg_file))
		endfor
	catch /.*/
		call s:error(
			\ 'Unable to read configuration files at ' . string(s:config_paths))
		echoerr v:exception
	endtry

	" If there's more than one config file source,
	" de-duplicate plugins by repo key.
	if len(s:config_paths) > 1
		call s:dedupe_plugins(l:merged)
	endif
	return l:merged
endfunction

function! s:dedupe_plugins(list)
	let l:list = reverse(a:list)
	let l:i = 0
	let l:seen = {}
	while i < len(l:list)
		let l:key = list[i]['repo']
		if l:key !=# '' && has_key(l:seen, l:key)
			call remove(l:list, i)
		else
			if l:key !=# ''
				let l:seen[l:key] = 1
			endif
			let l:i += 1
		endif
	endwhile
	return reverse(l:list)
endfunction

" General utilities, mainly for dealing with user configuration parsing
" ---

function! s:error(msg)
	for l:mes in s:str2list(a:msg)
		echohl WarningMsg | echomsg '[config/init] ' . l:mes | echohl None
	endfor
endfunction

function! s:debug(msg)
	for l:mes in s:str2list(a:msg)
		echohl WarningMsg | echomsg '[config/init] ' . l:mes | echohl None
	endfor
endfunction

function! s:load_config(filename)
	" Parse YAML/JSON config file
	if a:filename =~# '\.json$'
		" Parse JSON with built-in json_decode
		let l:json = readfile(a:filename)
		return has('nvim') ? json_decode(l:json) : json_decode(join(l:json))
	elseif a:filename =~# '\.ya\?ml$'
		" Parse YAML with common command-line utilities
		return s:load_yaml(a:filename)
	endif
	call s:error('Unknown config file format ' . a:filename)
	return ''
endfunction

function! s:str2list(expr)
	" Convert string to list
	return type(a:expr) ==# v:t_list ? a:expr : split(a:expr, '\n')
endfunction

" YAML related
" ---

let s:convert_tool = ''

function! s:load_yaml(filename)
	if empty(s:convert_tool)
		let s:convert_tool = s:find_yaml2json_method()
	endif

	if s:convert_tool ==# 'ruby'
		let l:cmd = "ruby -e 'require \"json\"; require \"yaml\"; ".
			\ "print JSON.generate YAML.load \$stdin.read'"
	elseif s:convert_tool ==# 'python'
		let l:cmd = "python -c 'import sys,yaml,json; y=yaml.safe_load(sys.stdin.read()); print(json.dumps(y))'"
	elseif s:convert_tool ==# 'yq'
		let l:cmd = 'yq e -j -I 0'
	else
		let l:cmd = s:convert_tool
	endif

	try
		let l:raw = readfile(a:filename)
		return json_decode(system(l:cmd, l:raw))
	catch /.*/
		call s:error([
			\ string(v:exception),
			\ 'Error loading ' . a:filename,
			\ 'Caught: ' . string(v:exception),
			\ ])
	endtry
endfunction

function! s:find_yaml2json_method()
	if exists('*json_decode')
		" Try different tools to convert YAML into JSON:
		if executable('yj') && s:test_yaml2json('yj')
			" See https://github.com/sclevine/yj
			return 'yj'
		elseif executable('yq') && s:test_yaml2json('yq')
			" See https://github.com/mikefarah/yq
			return 'yq'
		elseif executable('yaml2json') && s:test_yaml2json('yaml2json')
			" See https://github.com/bronze1man/yaml2json
			return 'yaml2json'
		" Or, try ruby. Which is installed on every macOS by default
		" and has yaml built-in.
		elseif executable('ruby') && s:test_ruby_yaml()
			return 'ruby'
		" Or, fallback to use python3 and PyYAML
		elseif executable('python') && s:test_python_yaml()
			return 'python'
		endif
		call s:error([
			\ 'Unable to find a proper YAML parsing utility.',
			\ 'Please run: pip3 install --user PyYAML',
			\ ])
	else
		call s:error('"json_decode" unsupported. Upgrade to latest Neovim or Vim')
	endif
endfunction

function! s:test_yaml2json(cmd)
	" Test yaml2json capabilities
	try
		let result = system(a:cmd, "---\na: 1.5")
		if v:shell_error != 0
			return 0
		endif
		let result = json_decode(result)
		return result.a == 1.5
	catch
	endtry
	return 0
endfunction

function! s:test_ruby_yaml()
	" Test Ruby YAML capabilities
	call system("ruby -e 'require \"json\"; require \"yaml\"'")
	return v:shell_error == 0
endfunction

function! s:test_python_yaml()
	" Test Python YAML capabilities
	call system("python -c 'import sys,yaml,json'")
	return v:shell_error == 0
endfunction

call s:use_dein()

" vim: set ts=2 sw=2 tw=80 noet :
