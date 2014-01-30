call pathogen#infect()

" Make crontab work on osx
au! BufNewFile,BufRead crontab.* set nobackup | set nowritebackup

"Display current cursor position in lower right corner. 
set ruler

" Syntax highlighting on
syntax on
filetype plugin indent on
hi Directory guifg=#FF0000 ctermfg=red
set cpoptions+=$

" Show the line number
" set number

" For pasting text that's already intended, swich to this mode.
set pastetoggle=<F3>

" Map jj to <ESC>
imap jj <Esc>
imap ff <Esc>:wa<CR>

" Turn incremental search on
set incsearch

" Highlighting all search patterns
set hlsearch

" Make NERDTree work on OS X
let NERDTreeDirArrows=0

" Make default comment blue in syntax better readable 
highlight comment ctermfg=lightblue

" Let Y behave consistently with D and C
nnoremap Y  y$

" keep 3 lines when scrolling
set scrolloff=3         

" UTF-8 Encoding
set encoding=utf-8

" choose no compatibility with legacy vi
set nocompatible

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Use comma as <Leader> key instead of backslash
let mapleader=","

" Switch between current and previous buffer
" http://mislav.uniqpath.com/2011/12/vim-revisited/
nnoremap <leader><leader> <c-^>

" Remap <C-]> to open the [t]ag in the vim help
" especially useful with german keyboard
nnoremap t <C-]>

" Make quitting vim without saving easier
noremap Q :q!<CR>

" Turns on the cursorline by default
set cursorline

" maximize the current window in new tab -> very helpfull!
nmap tt :tabedit %<CR>
nmap tg :tabclose<CR>
 
" j and k move by screen lines. Useful in wrapped text.
nnoremap j gj
nnoremap k gk

" <leader><space> clears search
nnoremap <leader><space> :noh<cr>

" <leader><leader> toggles between files
nnoremap <leader><leader> <c-^>

" Make MRU plugin work without hitting <enter> twice
nmap MRU :MRU<CR>

"Saves time; maps the spacebar to colon  
nmap <space> : 

"autopen NERDTree and focus cursor in new document  
"autocmd VimEnter * NERDTree  
"autocmd VimEnter * wincmd p 

"Helpeful abbreviations  
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.   
iab bpry require 'pry'; binding.pry          

" Wrap long lines
set wrap

" Tabs are 2 characters
set tabstop=2

" (Auto)indent uses 2 characters
set shiftwidth=2

" spaces instead of tabs
set expandtab

" guess indentation
set autoindent

" Make history big enough
set history=1000

" Turn on titlebar support
set title

"""" Backups/Swap Files (https://github.com/godlygeek/vim-files/blob/master/.vimrc)
" Make sure that the directory where we want to put swap/backup files exists.
if ! len(glob("~/.backup/"))
  echomsg "Backup directory ~/.backup doesn't exist!"
endif

set writebackup             " Make a backup of the original file when writing
set backup                  " and don't delete it after a succesful write.
set backupskip=             " There are no files that shouldn't be backed up.
set updatetime=2000         " Write swap files after 2 seconds of inactivity.
set backupext=~             " Backup for "file" is "file~"
set backupdir^=~/.backup    " Backups are written to ~/.backup/ if possible.
set directory^=~/.backup//  " Swap files are also written to ~/.backup, too.


" copy to buffer -> Usefull for copying text between different tmux session
" http://stackoverflow.com/questions/11042920/how-to-copy-and-paste-between-different-tmux-panes-running-vim-instances
vmap <C-c> :w! ~/.vimbuffer<CR>
nmap <C-c> :.w! ~/vimbuffer<CR>
" paste from buffer
nmap <leader>p :r ~/.vimbuffer<CR>

" http://www.philaquilina.com/2012/03/14/the-warm-embrace-of-vim-part-2/
" Easy toggle NERDTree
nmap <silent> <leader>n :NERDTreeToggle %:p:h<CR>

" The ultimate CtrlP opening dialog! Use it.
nmap <leader>d :CtrlP<cr>
nmap <leader>dd :CtrlPClearCache<cr>\|:CtrlP<cr>

" The way searching should work
nmap <leader>s :Ag 
" Search word under cursor
" Adapted from https://github.com/mileszs/ack.vim/issues/33
noremap <Leader>a :Ag <cword><cr>
  
" Ignore git .keep files and rails specific directories
" Ignore target directory in Play applications
" This is useful with CtrlP
set wildignore+=*/target/*,*.DS_Store,*/.target/*,*.keep,*/tmp/cache/*,*/vendor/*,*/doc/api/*,*/doc/guides/*

" Keep your existing 'textwidth' settings for most lines in your file, 
" but not have Vim automatically reformat when typing on existing lines
" http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
set formatoptions+=l


" Inspired from http://blog.stwrt.ca/2012/10/31/vim-ctags
nnoremap <leader>t :CtrlPTag<cr>
nmap <leader>b :TagbarToggle<CR>

" Variable renaming from http://vim.wikia.com/wiki/Search_and_replace_the_word_under_the_cursor 
:nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
:nnoremap <Leader>rr :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
