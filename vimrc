" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Set colors
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
colorscheme myinkpot
syntax on

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Set global options
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set nocompatible          " don't care about vi
set hidden                " hide buffers instead of closing
set backspace=2           " allow backspacing over autoindent, line breaks and start of insert
set cmdheight=3           " expand command area to 3 lines

set number                " show line numbers
set ruler                 " show line number in status
set cursorline            " show cursor line
set nowrap                " don't wrap long lines
set sidescrolloff=15      " scroll horizontally to show 15 characters
set scrolloff=8           " always show 8 lines

set wildmenu              " list options for tab completion instead of cycling
set wildmode=list:longest

set autoindent            " copy indent from current line
set copyindent
set smartindent
set cinoptions+=J1        " better javascript indenting
set shiftround            " round indent to multiple of shiftwidth for < and >
set smarttab              " insert blanks according to shiftwidth, not tabstop
set tabstop=4             " display tabs as 4 spaces
set shiftwidth=4
set softtabstop=4
set expandtab             " insert spaces instead of tabs in insert mode

set ignorecase            " ignore case when searching
set smartcase             " ignore case if search pattern is all lowercase, case-sensitive otherwise

set incsearch             " starts searching while you type
set nohlsearch            " don't highlight searches
set nofoldenable          " no folding
set wrapscan              " wrap around when searching

set laststatus=2          " always show a status line, even with only 1 window

set history=1000          " history of : commands
set undolevels=1000       " use many muchos of undo

set report=0              " always report number of changed lines
set shortmess+=I          " no intro TODO: might also add "a" 
set showfulltag           " show matching tag
set showmatch             " when a bracket is inserted, briefly jump to the matching one
set tildeop               " tilde should behave as an operator
set viminfo+='50          " remember marks for 50 previous files

set title                 " set window title

set nobackup              " no backups
set noswapfile            " no swap files
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set switchbuf=useopen     " when switching to a buffer that is already open in a window, switch to the window

if version >= 703
  set undofile
  set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
endif

set statusline=%<\ %{fnamemodify(getcwd(),\":~\")}\>\ %f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Set up grep
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set grepprg=$HOME/.vim/bin/ack

"set complete-=i

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Lets be smart about filetypes
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

filetype on
filetype plugin on
filetype indent on

if has('autocmd')
  autocmd filetype ruby setlocal sw=2 softtabstop=2
  autocmd BufReadPost quickfix setlocal nobuflisted " don't list quickfix window buffer
  autocmd BufNewFile,BufRead *.brs setf vb
  "autocmd BufWritePre *.rb :%s/\s\+$//e
endif

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Set shortcuts
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

nmap <silent> <leader>m :MRU<CR>

" Grep current word
map gr :grep <cword> <CR>

"make Y consistent with C and D
nnoremap Y y$

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Plugin options
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let MRU_Max_Entries = 100
