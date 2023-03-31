"reference: 
"http://realpython.com/vim-and-python-a-match-made-in-heaven/ 



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Git interface
Plugin 'tpope/vim-fugitive'

" Filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim' 

" Submode
Plugin 'kana/vim-submode'

" Show tags
Plugin 'majutsushi/tagbar'

" Undotree
Plugin 'simnalamburt/vim-mundo'

" Text-editting
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'

" Vim wiki for note taking and KB
Plugin 'vimwiki/vimwiki'

" nvim Treesitter for better syntax-hling, code folding, etc
Plugin 'nvim-treesitter/nvim-treesitter'

" Html
" isnowfy only compatible with python not python3
" Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'jtratner/vim-flavored-markdown'
" Plugin 'suan/vim-instant-markdown'
" Plugin 'nelstrom/vim-markdown-preview'
Plugin 'masukomi/vim-markdown-folding'

" Python sytax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'

" Auto-completion stuff
Plugin 'klen/python-mode'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'

" Code folding
Plugin 'tmhedberg/SimpylFold'

" Colors
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
Plugin 'endel/vim-github-colorscheme'

call vundle#end()
filetype plugin indent on    " enables filetype detection


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin: vim-lsp
"
"    Putting this first, so python language server starts up quickly.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
" 
" 	Global settings for all files (but may be overridden in ftplugin/<language>.vim files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" turn on mouse support
set mouse=a

set textwidth=100

" Word-wrapping.
"" Wrap visually, without inserting a newline
set wrap

"" Keeps words together at linebreak
set linebreak

" Indentation uses shftwidth variable
set shiftwidth=2

" Tab behavior.
"" Use spaces when tab key is pressed
set noexpandtab

"" Pressing tab uses tabstop variable 
set tabstop=2

" Set persistent undo
set undofile
set undodir=~/.vim/undo

" Backspaces as other programs
set backspace=indent,eol,start

"" Makes Backspace delete shftwideth (indentation step), rather than one
set smarttab

" Set new splits to appear on the right or bottom
set splitbelow
set splitright

" Ask for confirmation if unsaved changes exist when closing a file
set confirm

" Line numbers hybrid.
set nu rnu
" Command to toggle on/off.
noremap <F3> :set nu! rnu!<CR>

" Spell-check.
au BufNewFile,BufRead *.tex set spell

" Automatically set working directory to current file.
set autochdir

" Don't ad comment leader for new insert line
au BufEnter * set fo-=c fo-=r fo-=o 

" Color
syntax enable
set background=light
" Set the colorscheme: colorscheme [solarized, github,zenburn]
"colorscheme zenburn
"colorscheme solarized 

" Use the below highlight group when displaying bad whitespace is desired.
hi BadWhitespace ctermbg=red guibg=red
"hi LineNr ctermfg=gray
"hi Comment ctermfg=darkgrey cterm=bold

" Highlight cursorline
set cursorline
hi CursorLine cterm=None ctermbg=120 "LightBlue

" Set highlight search
set hlsearch
hi Search cterm=None ctermfg=Red ctermbg=LightMagenta

" Statusbar
" Show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Show full path to the file on the statusbar
set statusline+=%F


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin: vimwiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Currently, this is only set up for one vimwiki directory.
" For work, add `wiki_2` following the instructions here:
" https://opensource.com/article/18/6/vimwiki-gitlab-notes
" let g:vimwiki_list = [
"     \ {'path': '~/vimwiki-dataframe', 'syntax': 'markdown', 'ext': '.md'},
"     \ {'path': '~/vimwiki-personal', 'syntax': 'markdown', 'ext': '.md'}
"     \ ]
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext':	'.md'}] 
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_url_maxsave=0
let g:vimwiki_global_ext=0

" Makes vimwiki markdown links as [text](text.md) rather than [text](text)
" -- src: codevion's tutorial: https://www.youtube.com/watch?v=A1YgbAp5YRc&t=94s
let g:vimwiki_markdown_link_ext = 1

let g:markdown_foldering = 1
let g:taskwiki_markup_syntax = 'markdown'


" " Following vimwiki docs, use vfile in links to allow for non-.md files to be opened.
" function! VimwikiLinkHandler(link)
"   " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
"   "   1) [[vfile:~/Code/PythonProject/abc123.py]]
"   "   2) [[vfile:./|Wiki Home]]
"   let link = a:link
"   if link =~# '^vfile:'
"     let link = link[1:]
"   else
"     return 0
"   endif
"   let link_infos = vimwiki#base#resolve_link(link)
"   if link_infos.filename == ''
"     echomsg 'Vimwiki Error: Unable to resolve link!'
"     return 0
"   else
"     exe 'e' . fnameescape(link_infos.filename)
"     return 1
"   endif
" endfunction

" " To allow for completed objects to be a diff color.
" let g:vimwiki_hl_cb_checked = 2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin: TagToggleBar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TagToggleBar shortcut
let g:tagbar_ctags_bin="/usr/local/bin/ctags"


" It declares an automatic command (au), triggered when a buffer is read
" (BufRead), matching all files (*) and executes the zR (opens all folds)
" command in normal mode
au BufRead * normal zR

let g:SimpylFold_docstring_preview = 1
let g:pydiction_location = '/Users/hjsong/.vim/bundle/Pydiction/complete-dict' 

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1

map <leader>g:YcmCompleter GoToDefinitionElseDeclaration<CR>

" NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
"au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
"au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
"au BufRead,BufNewFile *.py,*.pyw set expandtab
"au BufRead,BufNewFile *.py set softtabstop=4

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
"Folding based on indentation:
autocmd FileType python setlocal foldmethod=indent
set foldlevel=99
set foldnestmax=2 " methods of classes are folded but not the internal statements

"use space to open folds
nnoremap <space> za
vnoremap <space> za 
"see: http://box.matto.nl/folding-markdown-in-vim-without-a-plugin.html"

"----------Code folding for markdown ----------
" Ref: https://github.com/masukomi/vim-markdown-folding#installation
let g:markdown_folding = 1
let g:markdown_enable_folding = 1

if has("autocmd")
	filetype plugin indent on
endif 
" no files are folded when opening
set nofoldenable

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

" netRW settings
let g:netrw_banner = 0 " don't show banner
let g:netrw_liststyle = 3 "use tree style
let g:netrw_browse_split = 2
let g:netrw_winsize = 25 "use 25% of the page


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hotkeys
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"custom keys
let mapleader=" "

" Save with leader s. Typo handling with capital W in command mode
nnoremap <Leader>s :w<CR>
cnoremap W w

" Yank from cursor to the end of line. Similarly to C and D
" nnoremap Y y$
"nnoremap U :echo " < < ===== C H E C K   C A P S   L O C K ===== > > "<CR>
nnoremap U u

" Jump to a line number using <Enter> 
"nnoremap <CR> G

" Save each line insert to undotree
"inoremap <CR> <C-G>u<CR> " TODO: this doesn't undo a whole copy-paste action

" Quickly insert or delete  a line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
nnoremap <Leader><BS> dd
nnoremap DD dd

" Buffer Switching
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

" Close terminal with <Esc>
tnoremap <Esc> <C-w>:q!<CR>

" Vimwiki diary navigation.
" nnoremap <C-j> :VimwikiDiaryNextDay<CR>
" nnoremap <C-k> :VimwikiDiaryPrevDay<CR>

" Goyo toggle.
nmap <Leader>g :Goyo<CR>

" Function Key remaps
nnoremap <Leader>n :NERDTreeToggle<cr>
nnoremap <Leader>t :TagbarToggle<cr>

" NERDTree setting
nmap <C-f> :NERDTreeToggle<CR>

" open NERDTree automatically
" autocmd VimEnter * NERDTree

" use the system clipboard
" https://gist.github.com/chrishunt/6042695
set clipboard=unnamed

" set autosave in vim
" src: https://stackoverflow.com/questions/17365324/auto-save-in-vim-as-you-type
" autocmd TextChanged,TextChangedI <buffer> silent write

" Make a visual column at 80, 100
set colorcolumn=80,100 
" refs: https://stackoverflow.com/a/3765575
"     : https://superuser.com/a/249856
"  :set cc=+1 " this will automaticall set the base value of 'colorcolumn'
" in relation to the textwidth. e.g., here colorcolumn = textwidth + 1


