" ------------------------------------------------------
" file:     $HOME/.vimrc
" author:   Ramon Solis - http://cyb3rpunk.wordpress.com
" modified: January 2011
" vim:fenc=utf-8:nu:ai:si:et:ts=4:sw=4:ft=vim:
" ------------------------------------------------------

" -----------
" colorscheme
" -----------
"if !has("gui_running")
"    colorscheme zenburn
"endif

set nocompatible 	    " This is VIM!
colorscheme herald
set background=dark     " Darky
set number              " Set numbers 
set showmatch		    " Show matching brackets

filetype plugin on
syntax on

set backspace=indent,eol,start " Make backspace work as usual
set tabstop=4

set shiftwidth=4
set encoding=utf-8 	    " Unicode support
set novisualbell 	    " Don't blink

" ------
" Indent
" ------
set autoindent          " Auto indenting
set smartindent 	    " Smart indenting 

" -----------
" Status line
" -----------
set showcmd 		    " Show (partial) command in status line
set showmode            " Show mode in status line
set cmdheight=1         " Set height of command
set laststatus=2 	    " Always show the status line
set statusline=\ \%f%m%r%h%w\ ::\ %y\ [%{&ff}]\%=\ [%p%%:\ %l/%L]\  " Credits to http://jasonwryan.com/


set mat=5   		    " How many tenths of a second to blink matching brackets for

" ------
" Search
" ------
set nohlsearch 		    " Do not highlight the string we searched
set incsearch 			" Incremental search: Highlight the searched string, while typing
set ignorecase          " Case-insensitive search
set smartcase           " Upper-case sensitive search
set wrapscan            " searches wrap back to the top of file

set fileformats=unix	" 
set ruler
set wrap                " wrap long lines to fit terminal width
set nobackup            " Disable backup
set swapfile
set updatecount=200
set directory=$HOME/.vim/tmp
set autochdir
set ttyfast             " tell vim we're using a fast terminal for redraws
set autoread            " Reload file if vim detects it changed elsewhere
set shell=/bin/zsh      " Default shell type
set history=666         " Lines of command history
set undolevels=666      " Set undo level
set title               " Set window title with the vim file
set ofu=syntaxcomplete#Complete
set nostartofline       " remember the cursor position

"set spell
"set colorcolumn=120

" --------
" NERDTree
" --------
" autocmd VimEnter * NERDTree " Start NERDTree 
" autocmd VimEnter * wincmd p " Focus on main window
let NERDTreeWinSize=25  " Increase window size to 35 columns
nmap <silent> <F7> :NERDTreeToggle<CR> " map <F7> to toggle NERDTree window
let NERDTreeShowHidden=1    " Show hidden files 

" -------------
" mapping stuff
" -------------
:nmap <C-t> :tabnew .<CR>
:imap <C-t> <Esc>:tabnew .<CR>
:map <C-w> :tabclose<CR>

" H|L to navigate trough the tabs
:map <S-h> gT
:map <S-l> gt

:nmap <C-a> :%y<CR>     " Yank all
:nmap <C-d> :1,$d<CR>   " Delete all
:map <C-o> O<Esc><CR>

