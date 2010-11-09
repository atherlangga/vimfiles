"======
" Begin common setting
"======

" First of all, configure pathogen
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" Vi-compatibility clearly makes Vim not optimal
set nocompatible

" Tab setting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Make Vim behave better
set encoding=utf-8
set scrolloff=3
set autoindent
set copyindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set wildignore=*.swp,*.bak,*.class,*.pyc
"set cursorline
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set fo-=c fo-=r fo-=o

" Just please, don't clutter my filesystem
set nobackup
set noswapfile

" Set the leader key
let mapleader=","

" Set search setting
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <tab> %
vnoremap <tab> %

" Make formatting easier
set listchars=tab:↔\ ,eol:▼,trail:▪

" Make long line information clearer
set wrap
"set textwidth=79
"set formatoptions=qrn1
set colorcolumn=85

" Force me to learn to movement the (great) movement key
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Make movement more natural
nnoremap j gj
nnoremap k gk

" Make inserting lines easier on normal mode
nnoremap <s-cr> O<esc>
nnoremap <cr> o<esc>

" Toggle invisible character
nnoremap <leader>h :set list!<cr>

" Get rid of F1
nnoremap <f1> <esc>
inoremap <f1> <esc>
vnoremap <f1> <esc>

" Make change mode easier
inoremap jj <esc>

" Make it even easier to type command
nnoremap ; :

" Split window view and then switch to it
nnoremap <leader>w <c-w>v<c-w>l

" Easy window resizing
noremap <A-h> <C-w><
noremap <A-j> <C-W>-
noremap <A-k> <C-W>+
noremap <A-l> <C-w>>

" Make formatting paragraph easier
vmap Q gq
vmap Q gqap

" Make indenting repetition easier
vmap > >gv
vmap < <gv

" Turn syntax on 
if &t_Co > 2 || has("gui_running")
    syntax on
endif

" Disable toolbar and menubar for screen real estate
if has("gui_running")
    set guioptions-=T
    set guioptions-=m
endif


"======
" Begin plugin-specific setting
"=====

nnoremap <f2> :NERDTreeToggle<cr>
vnoremap <f2> :NERDTreeToggle<cr>
inoremap <f2> <esc>:NERDTreeToggle<cr>

map <F4> :TlistToggle<CR>
map <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"======
" Begin OS-specific setting
"======

if has("unix")
    " Convenient command if I forgot to use sudo
    cmap w!! w !sudo tee % > /dev/null

    " Ensure display is 256 colors
    if $DISPLAY != ''
        set t_Co=256
    endif

    " My font choice for my linux laptop
    if has("gui_running")
       set guifont=Envy\ Code\ R\ 10 
    endif

elseif has("win32")
    " My font choice for my workstation
    if has("gui_running")
        set guifont=Consolas:h11:cANSI
    endif
endif


"======
" Finally, set the colorscheme
"======

if &t_Co >= 256 || has("gui_running")
    colorscheme molokai
endif

