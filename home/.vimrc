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
set cmdheight=2           " expand command area to 3 lines

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
set tags=tags;/           " search recursively upwards for tags file

set mouse=a               " make mouse work in tmux
set ttymouse=xterm2

if version >= 703
  set undofile
  set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
endif

set statusline=%<\ %{fnamemodify(getcwd(),\":~\")}\>\ %f\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%m%r%y%=%c,%l/%L\ %P

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Set up grep
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set grepprg=ag

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

" Map Nerdtree
nmap <silent> <leader>nj :NERDTree<CR>

" Grep current word
map gr :grep <cword> <CR>

"make Y consistent with C and D
nnoremap Y y$

"map gp to select pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" change cursor in insert mode
" ONLY WORKS in iTerm2!
"if exists('$ITERM_PROFILE')
    if exists('$TMUX')
        "let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        "let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
        let &t_SI = "\<Esc>[4 q"
        let &t_EI = "\<Esc>[2 q"
        "let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
        "let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
        "autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033[0 q\033\\"
    else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif
"endif

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Plugin options
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let MRU_Max_Entries = 100
let MRU_Use_Current_Window = 1 

" gitgutter colors
highlight lineAdded    guifg=#009900 guibg=NONE ctermfg=2 ctermbg=235
highlight lineModified guifg=#bbbb00 guibg=NONE ctermfg=3 ctermbg=235
highlight lineRemoved  guifg=#ff2222 guibg=NONE ctermfg=1 ctermbg=235

" colorcolumn past 120 characters
let &colorcolumn=join(range(121,999),",")

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Set paste/nopaste automatically when pasting
" https://coderwall.com/p/if9mda
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
set updatetime=100
let g:ale_virtualenv_dir_names = ['.venv', '.env', 'env', 've-py3', 've', 'virtualenv']
