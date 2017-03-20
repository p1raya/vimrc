source $VIMRUNTIME/vimrc_example.vim
"let $LANG="zh_CN.UTF-8"
set ambiwidth=double
set autoread
set cindent
set cmdheight=1
set encoding=utf-8
set foldlevel=0
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,cp936,gb18030,latin1
set guioptions=mR
if has("osx") || has("macunix")
    set guifontwide=兰亭黑-简\ 纤黑:h14
    set guifontwide=simhei:h14
else
    set guifont=DejaVu_Sans_Mono_for_Powerline:h11
    set guifontwide=simhei:h11
endif
"set helplang=cn
set history=500
set incsearch
set langmenu=zh_CN.UTF-8
set laststatus=2
set lazyredraw
set magic
set matchtime=2
set nobackup
set pastetoggle=<f2>
set ruler
set shiftwidth=4
set showmatch
set scrolloff=1
set t_Co=256    "number of colors
set tabstop=8
set termencoding=utf-8
if has("win32") || has("win64")
    source $VIMRUNTIME/mswin.vim
    behave mswin
    set undodir=D:\undofiles
else
    set undodir=~/.undofiles
endif
set wrap
"set whichwrap+=<,>,h,l
let g:html_font = 'Courier New'
try
    set matchpairs=(:),{:},[:],《:》,〈:〉,［:］,（:）,「:」,『:』,‘:’,“:”
    catch /^Vim\%((\a\+)\)\=:E474/
endtry
if has("gui_macvim")
    set macmeta
end

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"language messages zh_CN.UTF-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Vundle
"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
if has("win32") || has("win64")
    set rtp+=$HOME/bundle/Vundle.vim/
    call vundle#begin('$HOME/bundle/')
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"my Plugin here:
" original repos on github
Plugin 'vim-airline/vim-airline'
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    " old vim-powerline symbols
    let g:airline_left_sep = '⮀'
    let g:airline_left_alt_sep = '⮁'
    let g:airline_right_sep = '⮂'
    let g:airline_right_alt_sep = '⮃'
    let g:airline_symbols.branch = '⭠'
    let g:airline_symbols.readonly = '⭤'
    let g:airline_symbols.linenr = '⭡'
    let g:airline#extensions#whitespace#checks = [ 'indent' ]
Plugin 'vim-airline/vim-airline-themes'
    let g:airline_theme="powerlineish"
Plugin 'The-NERD-tree'
    " NERDTree settings {{{
    nnoremap <leader>n :NERDTreeToggle<CR>
    " Don't display these kinds of files
    let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
		\ '\.o$', '\.so$', '\.egg$', '^\.git$', '__pycache__', '\.DS_Store' ]
    " }}}
Plugin 'terryma/vim-multiple-cursors'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'ap/vim-css-color'
"..................................
" vim-scripts repos
" Indent
"Plugin 'IndentAnything'
" Color
Plugin 'nanotech/jellybeans.vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'notpratheek/vim-luna'
Plugin 'tomasr/molokai'
Plugin 'dterei/VimCobaltColourScheme'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

autocmd BufNewFile,BufRead *.py set
\ tabstop=4
\ softtabstop=4
\ shiftwidth=4
\ textwidth=80
\ smarttab
\ expandtab

" syntax off
colorscheme molokai
if has("gui_running") && has("win32")
    map  <F11> <ESC>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
    let g:VimAlpha = 240
    function! SetAlpha(alpha)
        let g:VimAlpha = g:VimAlpha + a:alpha
        if g:VimAlpha < 180
            let g:VimAlpha = 180
	elseif g:VimAlpha > 255
            let g:VimAlpha = 255
        endif
        call libcall("gvimfullscreen.dll", 'SetAlpha', g:VimAlpha)
    endfunction
    "F12
    nmap <F12> <Esc>:call SetAlpha(-5)<CR>
    "Shift+F12
    nmap <s-F12> <Esc>:call SetAlpha(5)<CR>
endif
