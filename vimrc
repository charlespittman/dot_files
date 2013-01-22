set nocompatible    " It's Vi IMproved!  We don't need to be compatible.

"-- Vundle options (begin) --"
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" original repos on github
Bundle 'altercation/vim-colors-solarized'
Bundle 'ervandew/supertab'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
Bundle 'mattn/zencoding-vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'oblitum/cSyntaxAfter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'skammer/vim-css-color'
Bundle 'tomasr/molokai'
Bundle 'tomtom/tcomment_vim'
Bundle 'Townk/vim-autoclose'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-ruby/vim-ruby'
Bundle 'xuhdev/SingleCompile'

" vim-scripts repos
Bundle 'Align'
Bundle 'bash-support.vim'
Bundle 'camelcasemotion'
Bundle 'DfrankUtil'
Bundle 'indexer.tar.gz'
Bundle 'matchit.zip'
Bundle 'mimicpak'
Bundle 'ScrollColors'
Bundle 'vimprj'
Bundle 'Zenburn'

" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
"-- Vundle options (end) --"

syntax on
set background=dark
set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=79

colorscheme solarized

set autoindent
set showcmd         " Show (partial) command in status line
set showmatch       " Show matching brackets
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set hlsearch        " Highlight the search
set hidden          " Hide buffers when they are abandoned
set noautowrite     " Don't automatically write when going to :next
set number          " Show line numbers in margin
set smarttab        " tab and backspace are smart
set expandtab       " I HATE tabs.  Expand to appropriate number of spaces

set foldmethod=syntax " Create folds based on the file's syntax

filetype on         " Enable filetype detection
filetype indent on  " Enable filetype-specific indenting
filetype plugin on  " Enable filetype-specific plugins

set ofu=syntaxcomplete#Complete   " Enable Omni completion

set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅    " Print tabs and trailing spaces

imap jj <ESC>   " Exit insert mode by typing jj
nmap q :q<CR>   " Exit normal mode by typing q
nmap Q :q!<CR>  " Exit normal mode without saving

"-- Tagbar options (begin) --"
nmap <F7> :TagbarToggle<CR>
let g:tagbar_compact = 1
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_autoshowtag = 1  " Open closed folds for tag under cursor
" Automatically open tagbar when a supported file is opened
"autocmd VimEnter * nested :call tagbar#autoopen(1)
"-- Tagbar options (end) --"

" Using the SingleCompile plugin. <F8> to compile, <F9> to compile & run
nmap <F8> :SCCompile<CR>
nmap <F9> :SCCompileRun<CR>

" Hit <F4> to remove trailing whitespace
nnoremap <silent> <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Printer options for :ha[rdcopy]
set printdevice=KM-3050
set printoptions=paper:letter,left:5pc,right:5pc,top:5pc,bottom:5pc,syntax:y,wrap:y,duplex:long

" Super fancy status line
python from powerline.ext.vim import source_plugin; source_plugin()
set laststatus=2

" Toggle 'paste' with notification
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>    " Toggle paste while in Insert mode
set showmode

"-- Syntax options (begin) --"
let g:tex_fold_enabled = 1    " LaTeX
let g:sh_fold_enabled = 7     " function, heredoc, and if/do/for folding
let python_highlight_all = 1  " highlight numbers, builtin functions, standard
                              " exceptions, and whitespace errors
let ruby_operators = 1        " Highlight operators
let ruby_space_errors = 1
let ruby_fold = 1
"-- Syntax options (end) --"
