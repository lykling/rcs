" vimrc ~/.vimrc
" Author:	Lykling
" Date: 	Sun Apr  1 00:31:27 CST 2012
" Usage: 	copy this file to home directory

autocmd! BufWritePost *.vimrc source $HOME/.vimrc
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

set nocompatible
"set noundofile
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

"set bsdir=buffer
"set autochdir

"set enc=utf-8
"set fenc=utf-8
set fencs=utf-8,ucs-bom,gb18030,gb2312,gbk,cp936

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

syntax enable
syntax on

""""""""""""""""""""""
" Vundle
""""""""""""""""""""""
" required by Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'mbbill/undotree'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'Yggdroot/LeaderF'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
"Plugin 'lykling/fecs.vim'
Plugin 'hushicai/fecs.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'moll/vim-node'
"Plugin 'mxw/vim-jsx'
"Plugin 'pangloss/vim-javascript'
"Plugin 'isRuslan/vim-es6'
Plugin 'othree/html5.vim'
Plugin 'groenewege/vim-less'
Plugin 'wavded/vim-stylus'
"Plugin 'tpope/vim-markdown'
"Plugin 'StanAngeloff/php.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'suan/vim-instant-markdown'
Plugin 'rust-lang/rust.vim'
Plugin 'yuezk/vim-js'
Plugin 'leafgarland/typescript-vim'
Plugin 'maxmellon/vim-jsx-pretty'
call vundle#end()
filetype plugin indent on

"colo murphy
"colorscheme default
"colorscheme desert
"colorscheme blue
"colorscheme darkblue
"colorscheme default
"colorscheme delek
"colorscheme desert
"colorscheme elflord
"colorscheme evening
"colorscheme industry
"colorscheme koehler
"colorscheme morning
"colorscheme murphy
"colorscheme pablo
colorscheme peachpuff
"colorscheme ron
"colorscheme shine
"colorscheme slate
"colorscheme torte
"colorscheme zellner

"set background=dark
"colorscheme solarized
"colorscheme neon

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
set nofoldenable
set cc=80
hi ColorColumn ctermbg=18 guibg=#073642
set list
set listchars=tab:..,trail:.
"set foldlevel=20
"set formatoptions=roctq
set formatoptions=tcrqn
autocmd filetype c,cpp,ruby,yaml set tabstop=2
autocmd filetype c,cpp,ruby,yaml set shiftwidth=2
autocmd filetype make set noexpandtab
autocmd filetype c,cpp,ruby,go,css,javascript,java,less,html,sh,python,tex,vim,htmldjango set expandtab
autocmd filetype json,markdown set conceallevel=0

set tags=./tags,./../tags,./../../tags,./**/tags

set fileformats=unix,dos

set cmdheight=1

""""""""""""""""""""""
" tools
""""""""""""""""""""""
" Rename
command! -nargs=1 Rename let tpname = expand('%') | saveas %:h/<args> | edit %:h/<args> | call delete(expand(tpname))

""""""""""""""""""""""
" comments
""""""""""""""""""""""
set comments=://
set comments=:s1:/*,mb:*,ex0:/

autocmd filetype go,c,css,javascript,java,less map <buffer> ;/ :s/\( *<tab>*\)\(.*\)/\1\/* \2 *\//<cr>:noh<cr>
autocmd filetype go,c,css,javascript,java,less map <buffer> ;? :s/\/\* \(.*\) \*\//\1/<cr>:noh<cr>
autocmd filetype html,htmldjango map <buffer> ;/ :s/\( *<tab>*\)\(.*\)/\1<!-- \2 -->/<cr>:noh<cr>
autocmd filetype html,htmldjango map <buffer> ;? :s/<!-- \(.*\) -->/\1/<cr>:noh<cr>
autocmd filetype sh,python map <buffer> ;/ :s/\( *<tab>*\)/\1#/<cr>:noh<cr>
autocmd filetype sh,python map <buffer> ;? :s/\( *<tab>*\)#/\1/<cr>:noh<cr>
autocmd filetype vim map <buffer> ;/ :s/\( *<tab>*\)/\1"/<cr>:noh<cr>
autocmd filetype vim map <buffer> ;? :s/\( *<tab>*\)"/\1/<cr>:noh<cr>
autocmd filetype tex map <buffer> ;/ :s/\(.*\)/\%\1/<cr>:noh<cr>
autocmd filetype tex map <buffer> ;? :s/^%\(.*\)/\1/<cr>:noh<cr>
nmap ;;// O/**<cr><cr><left>/<up> 

func! JSCommentHead()
    call setline(1, '/**')
    call append(1, '* Copyright (C) '.strftime('%Y').' All rights reserved.')
    call append(2, '*')
    call append(3, '* @file ')
    call append(4, '* @author Pride Leong<lykling.lyk@gmail.com>')
    call append(5, '*/')
endfunc
autocmd filetype javascript nmap <buffer> <F6> :call JSCommentHead()<cr>:1<cr>=6=:4<cr>A
func! JSComment()
    call append(line('.')-1, '')
    call setline(line('.')-1, '/**')
    call append(line('.')-1, '* @description ')
    call append(line('.')-1, '* @param ')
    call append(line('.')-1, '* @return ')
    call append(line('.')-1, '* @author Pride Leong<foliage@iooy.cc>')
    call append(line('.')-1, '*/')
endfunc
autocmd filetype javascript nmap <buffer> <F7> :call JSComment()<cr>6k=6=jA
func! ReplaceMail()
    %s/<lykling.lyk@gmail.com>/(liangjinping@baidu.com)/g
endfunc

""""""""""""""""""""""
" syntax
""""""""""""""""""""""
"autocmd filetype c imap <buffer> {} {<cr>}<up><end><cr>
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
    autocmd filetype go map <buffer> <F9> :!go build %<cr>

	autocmd filetype c,cpp,pascal,go map <buffer> ;<F9> :!./%:r < %:r.tdat<cr>
	autocmd filetype java map <buffer> ;<F9> :!java %:r<cr>
endif

""""""""""""""""""""""
" keymaps
""""""""""""""""""""""
map <c-p> :tabprevious<cr>
map <c-n> :tabnext<cr>
map <F2> ggVG"+Y
map ;<F2> ggVG"+P
nmap <S-right> :vertical resize +1<cr>
nmap <S-left> :vertical resize -1<cr>
nmap <S-up> :resize +1<cr>
nmap <S-down> :resize -1<cr>
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

"let b:javascript_fold=1
let javascript_enable_domhtmlcss=1
"autocmd filetype javascript setlocal foldlevel=1
let Tlist_js_settings = 'javascript;s:string;a:array;o:object;f:function'
"let Tlist_Auto_Open = 1
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1

""""""""""""""""""""""
" mark.vim
""""""""""""""""""""""
"nmap <c-m> \m
"nmap <c-/> \m
map m <Plug>MarkSet


""""""""""""""""""""""
" snapshots
""""""""""""""""""""""

func! JSModule()
    call append(line('.')+0, 'define(function (require, exports, module) {')
    call append(line('.')+1, '')
    call append(line('.')+2, '});')
endfunc
autocmd filetype javascript map <buffer> <F8> :call JSModule()<cr>j=3=jS

""""""""""""""""""""""
" go-vim
""""""""""""""""""""""
"set runtimepath^=~/.vim/bundle/vim-go
autocmd filetype go setlocal list
autocmd filetype go setlocal listchars=tab:¦\ 
autocmd filetype go setlocal noexpandtab
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
"let g:go_fmt_fail_silently = 1
"let g:go_fmt_command = "gofmt"
"let g:go_fmt_options = '-d=false -e=false -w=true -r="	->    "'

""""""""""""""""""""""
" ctrlp
""""""""""""""""""""""
"set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swo,*.swp,*.zip
let g:ctrlp_map = ',,'
let g:ctrlp_custom_ignore = {
            \   'dir':  '\v[\/]\.(git)$',
            \  'file': '\v\.(jpg|jpeg|log|png)$',
            \}

""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""
map <F3> :NERDTreeMirror<cr>
map <F4> :NERDTreeToggle<cr>
map <S-x> :NERDTreeFind<cr>

""""""""""""""""""""""
" indentLine
""""""""""""""""""""""
hi Conceal ctermfg=239 guifg=Grey30 ctermbg=0 guibg=black
let g:indentLine_faster = 1
let g:indentLine_fileTypeExclude = ["json", "markdown"]

""""""""""""""""""""""
" ag.vim
""""""""""""""""""""""
"let g:ackprg = 'ag --nogroup --nocolor --column'

""""""""""""""""""""""
" list
""""""""""""""""""""""
hi SpecialKey ctermfg=236

""""""""""""""""""""""
" vim-javascript
""""""""""""""""""""""
"let g:javascript_ignore_javaScriptdoc = 1

""""""""""""""""""""""
" hushicai/fecs.vim
""""""""""""""""""""""
" let g:syntastic_mode_map = {'mode': 'passive'} 
" nmap <silent> <F5> :SyntasticCheck<cr>
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_fecs_args = "--reporter=baidu"
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

""""""""""""""""""""""
" scrooloose/syntastic
""""""""""""""""""""""
set statusline=%<\ %n:%f\ %m%r%y%#warningmsg#%{SyntasticStatuslineFlag()}%*%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

""""""""""""""""""""""
" klen/python-mode
""""""""""""""""""""""
let g:pymode_rope = 0


""""""""""""""""""""""
" mbbill/undotree
""""""""""""""""""""""
nnoremap <F5> :UndotreeToggle<cr>

""""""""""""""""""""""
" leafgarland/typescript-vim
""""""""""""""""""""""
let g:typescript_indent_disable = 0
