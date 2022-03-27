"------------------------------------------------------------------------------
" Tim Setting
" -----------------------------------------------------------------------------
"
    let &termencoding=&encoding
    set fileencodings=utf-8,gbk,ucs-bom,cp936

" General Settings
    set number
    set mouse=a
    set ruler                           " show the cursor position all the time
    set nocompatible                    " not compatible with the old-fashion vi mode
    set backspace=2                     " allow backspacing over everything in insert mode
    set history=100                     " keep 100 lines of command line history
    set ai                              " auto align with previous line
    set clipboard=unnamed
    set noswapfile
    set wrap
    set linebreak
    set showcmd
    set scrolloff=3

" TAB setting
    set expandtab                       "replace <TAB> with spaces
    set softtabstop=4
    set shiftwidth=4
    set smarttab                        " insert tabs on the start of a line according to context

" Filetype setting
    filetype on                         " Enable filetype detection
    filetype indent on                  " Enable filetype-specific indenting
"   filetype plugin on

" Color configuration
    syntax on                           " syntax highlight
    set t_Co=256                        " 256 color mode
    set cursorline                      " highlight current line

    try
        colorscheme molokai
        let g:airline_theme = 'molokai'
        let g:airline_minimalist_showmod = 1
        let g:airline_powerline_fonts = 1
        let g:airline#extensions#tabline#enabled = 1
    catch
        colorscheme darkblue
    endtry

" Search
    set hlsearch
    set incsearch                       " incremental search
    set ignorecase                      " ignore case when searching
    set smartcase

" Window
    set splitbelow
    set splitright
    set showtabline=2

" Ctags
    set tags=./tags,tags;

" disable sound on errors
    set noerrorbells
    set novisualbell

" General Map
""  let mapleader=","
    nnoremap <Tab> >>
    nnoremap <S-Tab> <<
    nnoremap <Enter> o<Esc>
    nnoremap <S-Enter> O<Esc>
    inoremap jj <Esc>

" auto reload vimrc when editing it
    autocmd! bufwritepost _vimrc source ~/_vimrc

" auto delete all the empty after a sentence
    autocmd BufWritePre * :%s/\s\+$//e

    if executable("python")
        autocmd BufRead,BufNewFile *.py noremap <F5> :% w !python<Enter>
    else
        autocmd BufRead,BufNewFile *.py noremap <F5> :echo \"You need to install python first\"
    endif

" netrw setting
    let g:netrw_browse_split = 3        " 1:horizontal 2:veritcal 3:new tab 4:previous windos
    let g:netrw_winsize = 25

" NerTree Plug-In
    nnoremap <silent> <F2> :NERDTreeToggle<Enter>
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"--------------------------------------------------------------------------
"  PLUG-IN
"--------------------------------------------------------------------------

" Taglist
    nnoremap <silent> <F8> :TlistToggle<CR>

"--------------------------------------------------------------------------
"  https://github.com/junegunn/vim-plug
"  Plug-in Mgt junegunn / vim-plug
"--------------------------------------------------------------------------
" Reload .vimrc and :PlugInstall to install plugins.

    call plug#begin('~/vimfiles/plugged')

" https://github.com/vim-airline/vim-airline
    Plug 'vim-airline/vim-airline'

" https://github.com/preservim/nerdtree
    Plug 'preservim/nerdtree'

" http://github.com/yegappan/taglist
    Plug 'yegappan/taglist'

" https://github.com/craigemery/vim-autotag
    Plug 'craigemery/vim-autotag'

" https://github.com/chrisbra/csv.vim
    Plug 'chrisbra/csv.vim'

    call plug#end()
