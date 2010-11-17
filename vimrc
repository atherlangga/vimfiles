"======
" Begin common setting
"======

" First of all, configure pathogen
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" Vi-compatibility clearly makes Vim not optimal
set nocompatible

" Set the Leader key
let mapleader=","

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
set ruler
set backspace=indent,eol,start
set laststatus=2
set number

" Just please, don't clutter my filesystem
set nobackup
set noswapfile

" Set search setting
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <Leader><space> :nohlsearch<CR>
nnoremap <tab> %
vnoremap <tab> %

" Invisible character configuration
set listchars=tab:↔\ ,eol:▼,trail:▪
nnoremap <Leader>h :set list!<CR>

" Make long lines configuration 
set wrap
set textwidth=79

" Make movement more natural
nnoremap j gj
nnoremap k gk

" Make inserting lines easier on normal mode
nnoremap <S-CR> O<Esc>
nnoremap <CR> o<Esc>

" Toggle invisible character

" Get rid of F1
nnoremap <F1> <Esc>
inoremap <F1> <Esc>
vnoremap <F1> <Esc>

" Make change mode easier
inoremap '' <Esc>

" Make it even easier to type command
nnoremap ; :

" Window management configuration
nnoremap <Leader>w <C-w>v<C-w>l
noremap <A-h> <C-w><
noremap <A-j> <C-W>-
noremap <A-k> <C-W>+
noremap <A-l> <C-w>>

" Make formatting easier
vmap Q gq
vmap Q gqap
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

" Disable comment auto completion.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


"======
" Begin plugin-specific setting
"=====

" NERDTree
map <F2> :NERDTreeToggle<CR>

" Tlist
map <F4> :TlistToggle<CR>

" Ctags
map <F8> :!ctags --recurse --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Minibufexplorer
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1

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

