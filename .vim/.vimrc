" vimrc ~/.vimrc
" Author:	Lykling
" Date: 	Sun Apr  1 00:31:27 CST 2012
" Usage: 	copy this file to home directory

autocmd! BufWritePost *.vimrc source $HOME/.vimrc
" Jump to last post
"au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
set exrc
set secure
autocmd BufRead scp://* :set bt=acwrite
autocmd BufWritePost scp://* :set bt=acwrite


set nocompatible
"set noundofile
if has("persistent_undo")
    set undodir=~/.vim/.undodir/,/tmp//
    set undofile
endif

"set bsdir=buffer
"set autochdir

set enc=utf-8
"set fenc=utf-8
set fencs=utf-8,ucs-bom,gb18030,gb2312,gbk,cp936

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set nobackup
set nowritebackup
set backupcopy=no

set swapfile
set dir=~/.vim/.swap-files//,/tmp//,./

syntax enable
syntax on

""""""""""""""""""""""
" vim-plug
""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'mbbill/undotree'
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'skywind3000/gutentags_plus'
Plug 'bazelbuild/vim-ft-bzl'
Plug 'fatih/vim-go'
"Plug 'scrooloose/syntastic'
Plug 'dense-analysis/ale'
"Plug 'kien/ctrlp.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Yggdroot/indentLine'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
"Plug 'lykling/fecs.vim'
Plug 'hushicai/fecs.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'moll/vim-node'
"Plug 'mxw/vim-jsx'
"Plug 'pangloss/vim-javascript'
"Plug 'isRuslan/vim-es6'
Plug 'othree/html5.vim'
Plug 'groenewege/vim-less'
Plug 'wavded/vim-stylus'
"Plug 'tpope/vim-markdown'
"Plug 'StanAngeloff/php.vim'
Plug 'scrooloose/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'
Plug 'klen/python-mode'
"Plug 'jmcantrell/vim-virtualenv'
"Plug 'sansyrox/vim-python-virtualenv'
"Plug 'suan/vim-instant-markdown'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'rust-lang/rust.vim'
Plug 'yuezk/vim-js'
Plug 'leafgarland/typescript-vim'
Plug 'towolf/vim-helm'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ycm-core/YouCompleteMe'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
"Plug 'rhysd/vim-clang-format'
Plug 'bazelbuild/vim-bazel'
"Plug 'grailbio/bazel-compilation-database'
Plug 'jamessan/vim-gnupg'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'cormacrelf/vim-colors-github'
Plug 'joshdick/onedark.vim'
Plug 'nonetallt/vim-neon-dark'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nordtheme/vim'
Plug 'rakr/vim-one'
Plug 'sainnhe/everforest'
Plug 'altercation/vim-colors-solarized'
Plug 'ianding1/leetcode.vim'
Plug 'github/copilot.vim'
call plug#end()

""""""""""""""""""""""
" ludovicchabant/vim-gutentags & skywind3000/gutentags_plus
""""""""""""""""""""""
let g:gutentags_modules = ['ctags']

let g:gutentags_plus_switch = 1

let g:gutentags_define_advanced_commands = 1

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" For universal ctags
" let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

"""""""""""""""""""""""
"" Vundle
"""""""""""""""""""""""
"" required by Vundle
"filetype off
"set rtp+=~/.vim/bundle/Vundle.vim/
"call vundle#begin()
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'mbbill/undotree'
"Plugin 'fatih/vim-go'
"Plugin 'scrooloose/syntastic'
"Plugin 'kien/ctrlp.vim'
"Plugin 'Yggdroot/indentLine'
"Plugin 'Yggdroot/LeaderF'
"Plugin 'mileszs/ack.vim'
"Plugin 'rking/ag.vim'
""Plugin 'lykling/fecs.vim'
"Plugin 'hushicai/fecs.vim'
"Plugin 'vim-ruby/vim-ruby'
"Plugin 'moll/vim-node'
""Plugin 'mxw/vim-jsx'
""Plugin 'pangloss/vim-javascript'
""Plugin 'isRuslan/vim-es6'
"Plugin 'othree/html5.vim'
"Plugin 'groenewege/vim-less'
"Plugin 'wavded/vim-stylus'
""Plugin 'tpope/vim-markdown'
""Plugin 'StanAngeloff/php.vim'
"Plugin 'scrooloose/nerdtree'
"Plugin 'klen/python-mode'
"Plugin 'suan/vim-instant-markdown'
"Plugin 'rust-lang/rust.vim'
"Plugin 'yuezk/vim-js'
"Plugin 'leafgarland/typescript-vim'
"Plugin 'maxmellon/vim-jsx-pretty'
"call vundle#end()
"filetype plugin indent on

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
"colorscheme peachpuff
"colorscheme ron
"colorscheme shine
"colorscheme slate
"colorscheme torte
"colorscheme zellner

"colorscheme github
"colorscheme onedark
"colorscheme neon-dark
"colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
"vim.cmd.colorscheme "catppuccin"
colorscheme nord
"colorscheme one
"set background=dark

"" Important!!
"if has('termguicolors')
"    set termguicolors
"endif
"" For dark version.
"set background=dark
"" For light version.
"set background=light
"" Set contrast.
"" This configuration option should be placed before `colorscheme everforest`.
"" Available values: 'hard', 'medium'(default), 'soft'
"let g:everforest_background = 'soft'
"" For better performance
"let g:everforest_better_performance = 1
"colorscheme everforest

"set background=dark
"colorscheme solarized
"colorscheme neon

set nu
set showmatch
set hlsearch
set hls is
set incsearch
set ruler
set mouse=a
"set mouse=h
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
set cino=N-s

"set tags=./tags,./../tags,./../../tags,./**/tags
set tags=./.tags;,.tags

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
"autocmd filetype javascript nmap <buffer> <F6> :call JSCommentHead()<cr>:1<cr>=6=:4<cr>A
func! JSComment()
    call append(line('.')-1, '')
    call setline(line('.')-1, '/**')
    call append(line('.')-1, '* @description ')
    call append(line('.')-1, '* @param ')
    call append(line('.')-1, '* @return ')
    call append(line('.')-1, '* @author Pride Leong<foliage@iooy.cc>')
    call append(line('.')-1, '*/')
endfunc
"autocmd filetype javascript nmap <buffer> <F7> :call JSComment()<cr>6k=6=jA
func! ReplaceMail()
    %s/<lykling.lyk@gmail.com>/(liangjinping@baidu.com)/g
endfunc

""""""""""""""""""""""
" syntax
""""""""""""""""""""""
"autocmd filetype c imap <buffer> {} {<cr>}<up><end><cr>
"autocmd filetype c imap <buffer> // /*  */<left><left><left>

""""""""""""""""""""""
" program test
""""""""""""""""""""""
if filereadable("Makefile")
    map <F9> :!make<cr>
else
    autocmd filetype c map <buffer> <F9> :!gcc -fsanitize=address -fno-omit-frame-pointer -lm -lpthread -pthread -g "%" -Wall -o "%:r"<cr>
    autocmd filetype cpp map <buffer> <F9> :!g++ --std=c++11 -fsanitize=address -fno-omit-frame-pointer -lm -lpthread -pthread -lcurl -g "%" -Wall -o "%:r"<cr>
    autocmd filetype pascal map <buffer> <F9> :!gpc  -g "%" -Wall -o "%:r"<cr>
    autocmd filetype java map <buffer> <F9> :!javac "%"<cr>
    autocmd filetype python map <buffer> <F9> :!python "%"<cr>
    autocmd filetype expect map <buffer> <F9> :!expect "%"<cr>
    autocmd filetype sh map <buffer> <F9> :!sh "%"<cr>
    autocmd filetype asm map <buffer> <F9> :!nasm % -o"%:r"<cr>
    autocmd filetype go map <buffer> <F9> :!go build "%"<cr>

    autocmd filetype c,cpp,pascal,go map <buffer> ;<F9> :!./"%:r" < "%:r".tdat<cr>
    autocmd filetype java map <buffer> ;<F9> :!java "%:r"<cr>
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
nmap <leader>tn :tn<cr>
nmap <leader>tp :tp<cr>
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
map M <Plug>MarkClear
map <leader>n :call <SNR>27_SearchCurrentMark()<CR>
map <leader>N \#
map <leader><leader>n \/
map <leader><leader>N \?


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
"map <F3> :NERDTreeMirror<cr>
map <F4> :NERDTreeToggle<cr>
map <S-x> :NERDTreeFind<cr>

""""""""""""""""""""""
" indentLine
""""""""""""""""""""""
hi Conceal ctermfg=239 guifg=Grey30 ctermbg=0 guibg=black
let g:indentLine_faster = 1
let g:indentLine_fileTypeExclude = ["json", "markdown"]

""""""""""""""""""""""
" Yggdroot/LeaderF
""""""""""""""""""""""
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

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
" vim-airline
""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'github'

""""""""""""""""""""""
" scrooloose/syntastic
""""""""""""""""""""""
"set statusline=%<\ %n:%f\ %m%r%y%#warningmsg#%{SyntasticStatuslineFlag()}%*%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
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


""""""""""""""""""""""
" ycm-core/YouCompleteMe
""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" let g:ycm_show_diagnostics_ui = 0
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_extra_conf_globlist = [ '~/.vim/.ycm_extra_conf.py' ]
let g:ycm_collect_identifiers_from_tags_files = 0
let ycm_min_num_of_chars_for_completion = 1
" let g:ycm_cache_omnifunc = 0
let g:ycm_seed_identifiers_with_syntax = 1
" let g:ycm_goto_buffer_command = 'horizontal-split'
map <F3> :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <F6> :YcmCompleter GoToReferences<CR>
" map <c-J> :YcmCompleter GoToDefinitionElseDeclaration<CR>
"let g:ycm_clangd_binary_path = trim(system('which clangd'))

""""""""""""""""""""""
" dense-analysis/ale
""""""""""""""""""""""
autocmd filetype c,cpp :ALEDisableBuffer
"let g:ale_fixers = {
"\   'javascript': ['prettier', 'eslint', 'remove_trailling_lines', 'trim_whitespace'],
"\   'python': ['flake8', 'rylint', 'remove_trailling_lines', 'trim_whitespace'],
"\}
let g:ale_fix_on_save = 1

""""""""""""""""""""""
" neoclide/coc.nvim
""""""""""""""""""""""
autocmd fileType python let b:coc_root_patterns = ['.git', '.env']
let g:coc_global_extensions = [
            \'coc-markdownlint',
            \'coc-highlight',
            \'coc-eslint',
            \'coc-sh',
            \'coc-vetur',
            \'coc-go',
            \'coc-explorer',
            \'coc-flutter',
            \'coc-json',
            \'coc-yaml',
            \'coc-tsserver',
            \'coc-pyright',
            \'coc-snippets',
            \'coc-git',
            \'coc-protobuf'
            \]
""""""""""""""""""""""
" google/vim-glaive
""""""""""""""""""""""
call glaive#Install()
""""""""""""""""""""""
" google/vim-codefmt
""""""""""""""""""""""
augroup autoformat_settings
  autocmd FileType sh AutoFormatBuffer shfmt
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,arduino AutoFormatBuffer clang-format
  autocmd FileType typescript,typescriptreact,json,javascript AutoFormatBuffer prettier
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  " autocmd FileType python AutoFormatBuffer yapf
  autocmd FileType python AutoFormatBuffer autopep8
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

" Glaive codefmt shfmt_options=`['-i', '2', '-ci', '-kp']`
" Glaive codefmt shfmt_options=`[]`

""""""""""""""""""""""
" termdebug
""""""""""""""""""""""
let g:termdebug_popup = 0
let g:termdebug_wide = 163
autocmd filetype c,cpp :packadd termdebug

""""""""""""""""""""""
" ianding1/leetcode.vim
""""""""""""""""""""""
let g:leetcode_browser = 'chrome'
let g:leetcode_solution_filetype = 'c'
