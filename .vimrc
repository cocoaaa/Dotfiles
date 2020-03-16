"reference: 
"http://realpython.com/vim-and-python-a-match-made-in-heaven/ 

"vundle
set nocompatible
filetype off


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"git interface
Plugin 'tpope/vim-fugitive'
"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim' 

" Show tags
Plugin 'majutsushi/tagbar'

" Undotree
Plugin 'simnalamburt/vim-mundo'


"text-editting
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

"html
"  isnowfy only compatible with python not python3
Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'


"python sytax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'

"auto-completion stuff
Plugin 'klen/python-mode'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'

""code folding
Plugin 'tmhedberg/SimpylFold'

"Colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

call vundle#end()

filetype plugin indent on    " enables filetype detection

" Global settings for all files (but may be overridden in
" ftplugin/<language>.vim files
set tabstop=2
set shiftwidth=2
set noexpandtab
" Don't ad comment leader for new insert line
au BufEnter * set fo-=c fo-=r fo-=o 
set confirm
" TagToggleBar shortcut
let g:tagbar_ctags_bin="/usr/local/bin/ctags"
nnoremap <F2> :TagbarToggle<cr>

" Yank from cursor to the end of line. Similarly to C and D
"nnoremap Y y$
nnoremap U :echo " < < ===== C H E C K   C A P S   L O C K ===== > > "<CR>

" Set persistent undo
set undofile
set undodir=~/.vim/undo

let g:SimpylFold_docstring_preview = 1
let g:pydiction_location = '/Users/hjsong/.vim/bundle/Pydiction/complete-dict' 

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1

"custom keys
let mapleader=" "
map <leader>g:YcmCompleter GoToDefinitionElseDeclaration<CR>

"colorscheme zenburn
"set guifont=Monaco:h14

" NERDTree
nnoremap <F1> :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"I don't like swap files
set noswapfile

"turn on numbering
set nu
set textwidth=80
set fo+=cq
"it would be nice to set tag files by the active virtualenv here
":set tags=~/mytags "tags for ctags and taglist
"omnicomplete
"autocmd FileType python set omnifunc=pythoncomplete#Complete

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
"au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
"au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
"au BufRead,BufNewFile *.py,*.pyw set expandtab
"au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
"au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=120

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start

"Folding based on indentation:
autocmd FileType python set foldmethod=indent
set foldlevel=99

"use space to open folds
nnoremap <space> za 
"----------Stop python PEP 8 stuff--------------

"js stuff"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

"" turn on completion in comments
let g:ycm_complete_in_comments=1
"" load ycm conf by default
let g:ycm_confirm_extra_conf=0
"" turn on tag completion
let g:ycm_collect_identifiers_from_tags_files=1
"" only show completion as a list instead of a sub-window
set completeopt-=preview
"" start completion from the first character
let g:ycm_min_num_of_chars_for_completion=1
"" don't cache completion items
let g:ycm_cache_omnifunc=0
"" complete syntax keywords
let g:ycm_seed_identifiers_with_syntax=1

" turn on mouse support
set mouse=a

" Close terminal with <Esc>
tnoremap <Esc> <C-w>:q!<CR>

"Jump to a line number using <Enter> 
nnoremap <CR> G

" Highlight cursor line
set cursorline
hi CursorLine cterm=None ctermbg=120 "LightBlue
" Set new splits to appear on the right or bottom
set splitbelow
set splitright

" It declares an automatic command (au), triggered when a buffer is read
" (BufRead), matching all files (*) and executes the zR (opens all folds)
" command in normal mode
au BufRead * normal zR

" Set highlight search
set hlsearch
hi Search cterm=None ctermfg=Red ctermbg=LightMagenta

" netRW settings
let g:netrw_banner = 0 " don't show banner
let g:netrw_liststyle = 3 "use tree style
let g:netrw_browse_split = 2
let g:netrw_winsize = 25 "use 25% of the page

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
" src: https://vim.fandom.com/wiki/Easier_buffer_switching
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" Show full path to the file on the statusbar
set statusline+=%F
