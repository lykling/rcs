" vimrc ~/.vimrc
" Author:	Lykling
" Date: 	Sun Apr  1 00:31:27 CST 2012
" Usage: 	copy this file to home directory

autocmd! BufWritePost *.vimrc source $HOME/.vimrc

"colo murphy
"colorscheme default
colorscheme desert

set nocompatible

set bsdir=buffer
"set autochdir

"set enc=utf-8
"set fenc=utf-8
set fencs=utf-8,ucs-bom,gb18030,gb2312,gbk,cp936

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

syntax enable
syntax on
filetype plugin indent on
filetype on

set nu
set showmatch
set hlsearch
set hls is
set incsearch
set ruler
"set mouse=a
set mouse=h
set backspace=2

set ai
set si
set cindent
"set cindent shiftwidth=4
"set autoindent shiftwidth=4
set tabstop=4
set shiftwidth=4
set expandtab
set foldmethod=indent
"set formatoptions=roctq
set formatoptions=tcrqn
autocmd filetype c,cpp set tabstop=2
autocmd filetype c,cpp set shiftwidth=2
autocmd filetype make set noexpandtab

set comments=://
set comments=:s1:/*,mb:*,ex0:/

set tags=./tags,./../tags,./../../tags,./**/tags

set fileformats=unix,dos

set cmdheight=1

""""""""""""""""""""""
" comments
""""""""""""""""""""""
autocmd filetype c,css,javascript,java map <buffer> ;/ :s/\( *<tab>*\)\(.*\)/\1\/* \2 *\//<cr>:noh<cr>
autocmd filetype c,css,javascript,java map <buffer> ;? :s/\/\* \(.*\) \*\//\1/<cr>:noh<cr>
autocmd filetype html,htmldjango map <buffer> ;/ :s/\( *<tab>*\)\(.*\)/\1<!-- \2 -->/<cr>:noh<cr>
autocmd filetype html,htmldjango map <buffer> ;? :s/<!-- \(.*\) -->/\1/<cr>:noh<cr>
autocmd filetype sh,python map <buffer> ;/ :s/\( *<tab>*\)/\1#/<cr>:noh<cr>
autocmd filetype sh,python map <buffer> ;? :s/\( *<tab>*\)#/\1/<cr>:noh<cr>
autocmd filetype vim map <buffer> ;/ :s/\( *<tab>*\)/\1"/<cr>:noh<cr>
autocmd filetype vim map <buffer> ;? :s/\( *<tab>*\)"/\1/<cr>:noh<cr>
autocmd filetype tex map <buffer> ;/ :s/\(.*\)/\%\1/<cr>:noh<cr>
autocmd filetype tex map <buffer> ;? :s/^%\(.*\)/\1/<cr>:noh<cr>
nmap ;;// O/**<cr><cr><left>/<up> 

""""""""""""""""""""""
" syntax
""""""""""""""""""""""
autocmd filetype c imap <buffer> {} {<cr>}<up><end><cr>
autocmd filetype c imap <buffer> // /*  */<left><left><left>

""""""""""""""""""""""
" program test
""""""""""""""""""""""
if filereadable("Makefile")
	map <F9> :!make<cr>
else
	autocmd filetype c map <buffer> <F9> :!gcc -lm -g % -Wall -o %:r<cr>
	autocmd filetype cpp map <buffer> <F9> :!g++ -lm -g % -Wall -o %:r<cr>
	autocmd filetype pascal map <buffer> <F9> :!gpc  -g % -Wall -o%:r<cr>
	autocmd filetype java map <buffer> <F9> :!javac %<cr>
	autocmd filetype python map <buffer> <F9> :!python %<cr>
	autocmd filetype expect map <buffer> <F9> :!expect %<cr>
	autocmd filetype sh map <buffer> <F9> :!sh %<cr>
	autocmd filetype asm map <buffer> <F9> :!nasm % -o%:r<cr>

	autocmd filetype c,cpp,pascal map <buffer> ;<F9> :!./%:r < %:r.tdat<cr>
	autocmd filetype java map <buffer> ;<F9> :!java %:r<cr>
endif

""""""""""""""""""""""
" keymaps
""""""""""""""""""""""
map <c-p> :tabprevious<cr>
map <c-n> :tabnext<cr>
map <F2> ggVG"+Y
map ;<F2> ggVG"+P
map <F3> :NERDTreeMirror<cr>
map <F4> :NERDTreeToggle<cr>
map <s-insert> <middlemouse>
map! <s-insert> <middlemouse>
autocmd filetype java map <buffer> <F11> :JavaBrowser<cr>
autocmd filetype java imap <buffer> <F11> <ESC><F11>

""""""""""""""""""""""
" keymap for split
""""""""""""""""""""""
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

""""""""""""""""""""""
" brackets
""""""""""""""""""""""
imap "" ""<left>
imap {} {}<left>
imap () ()<left>
imap [] []<left>
imap '' ''<left>
imap <> <><left>

let twitvim_enable_python = 1
let twitvim_browser_cmd = 'firefox-bin'
let twitvim_count = 39

let JavaBrowser_Ctags_Cmd = '/usr/bin/ctags'
let JavaBrowser_Use_Icon = 1
let JavaBrowser_Use_Highlight_Tag = 1

let b:javascript_fold=1
let javascript_enable_domhtmlcss=1
"autocmd filetype javascript setlocal foldlevel=1
let Tlist_js_settings = 'javascript;s:string;a:array;o:object;f:function'
"let Tlist_Auto_Open = 1
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
