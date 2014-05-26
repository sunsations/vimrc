" Make sure machit is active. This is a dependency for 
" several plugins.
runtime macros/matchit.vim

call pathogen#infect()
call pathogen#helptags()

" Make crontab work on osx
au! BufNewFile,BufRead crontab.* set nobackup | set nowritebackup

"Display current cursor position in lower right corner. 
set ruler

" hides buffers instead of closing them
" http://nvie.com/posts/how-i-boosted-my-vim/
set hidden

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
" Map ff  to <ESC> and save file. Can sometimes be annoying when writing a double f
imap ff <Esc>:wa<CR>

" Turn incremental search on
set incsearch

" Highlighting all search patterns
set hlsearch

" make regex behave like normal programming languages
" http://lonelyproton.com/2013/11/useful-vim-settings/
nnoremap / /\v
nnoremap ? ?\v

" Make default comment blue in syntax better readable 
highlight comment ctermfg=lightblue

" Let Y behave consistently with D and C
nnoremap Y  y$

" keep 3 lines when scrolling
set scrolloff=3         

" UTF-8 Encoding
set encoding=utf-8

" Bash doesn’t load your .bashrc unless it’s interactive.
" http://stackoverflow.com/questions/4642822/commands-executed-from-vim-are-not-recognizing-bash-command-aliases
:set shellcmdflag=-ic

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
" <leader><leader> is used as a prefix for easymotion
" nnoremap <leader><leader> <c-^>
nnoremap mm <c-^>

" Remap <C-]> to open the [t]ag in the vim help
" especially useful with german keyboard
nnoremap t <C-]>

" Quick vim easily
noremap qq :qa!<CR>

" Turns on the cursorline by default
set cursorline

" maximize the current window in new tab -> very helpfull!
noremap tt :tabedit %<CR>
noremap tg :tabclose<CR>

" Quick an easy tab navigation
" http://vim.wikia.com/wiki/Alternative_tab_navigation
" see http://stackoverflow.com/questions/7501092/can-i-map-alt-key-in-vim
" to remap ALT in mac
nnoremap º :tabprevious<CR>
nnoremap ∆ :tabnext<CR>
inoremap º <Esc>:tabprevious<CR>i
inoremap ∆ <Esc>:tabnext<CR>i
nnoremap th :tabfirst<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tl :tablast<CR>

" Easy navigation to quick list matchings, e.g. search result by silver searcher
" Alt + y
noremap ¥ :cp<CR>
" Alt + x
noremap ≈ :cn<CR>

" http://stackoverflow.com/questions/2119754/switch-to-last-active-tab-in-vim
" really nice to switch between last to active tabs
let g:lasttab = 1
nnoremap ∫ :exe "tabn ".g:lasttab<CR> " ∫ = ALT + B
au TabLeave * let g:lasttab = tabpagenr() 

" j and k move by screen lines. Useful in wrapped text.
nnoremap j gj
nnoremap k gk

" <leader><space> clears search
nnoremap <leader><space> :noh<cr>

" Make MRU plugin work without hitting <enter> twice
noremap MRU :MRU<CR>

"Helpeful abbreviations  
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.   
iab bpry require 'pry'; binding.pry
iab teh the
iab tihs this

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
set history=10000

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
noremap <C-c> :.w! ~/vimbuffer<CR>
" paste from buffer
noremap <leader>p :r ~/.vimbuffer<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" http://www.philaquilina.com/2012/03/14/the-warm-embrace-of-vim-part-2/
" Easy toggle NERDTree
noremap <silent> <leader>n :NERDTreeToggle %:p:h<CR>
" Make NERDTree work on OS X
let NERDTreeDirArrows=0
" http://stackoverflow.com/questions/7692233/nerdtree-reveal-file-in-tree
noremap <silent> <leader>m :NERDTreeFind<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The ultimate CtrlP opening dialog! Use it.
noremap <leader>d :CtrlP<cr>
noremap <leader>dd :CtrlPClearCache<cr>\|:CtrlP<cr>


" Easily reload vimrc (this file)
" This is important to edit this file
" and make changes available without 
" restarting vim.
noremap <leader>ee :source $MYVIMRC<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Silver Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The way searching should work, leave space at end
noremap <leader>s :Ag 
noremap <leader>R :Ag -G '.*.rb' 
noremap <leader>S :Ag -G '.*spec*.rb' 
noremap <leader>C :Ag -G '.*ss$' 
noremap <leader>Y :Ag -G '.*yml' 
" Search word under cursor
" Adapted from https://github.com/mileszs/ack.vim/issues/33
noremap <Leader>a :Ag <cword><cr>
  
" Ignore git .keep files and rails specific directories
" Ignore target directory in Play applications
" This is useful with CtrlP
" _site => for genrated jekyll content
set wildignore+=*/target/*,*.DS_Store,*/.target/*,*.keep,*/tmp/cache/*,*/doc/api/*,*/doc/guides/*,*/_site/*,*/.bundle/*
" vendor dir for gem installed vim gem
"set wildignore+=*/vendor/*

" Keep your existing 'textwidth' settings for most lines in your file, 
" but not have Vim automatically reformat when typing on existing lines
" http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
set formatoptions+=l

" Inspired from http://blog.stwrt.ca/2012/10/31/vim-ctags
nnoremap <leader>t :CtrlPTag<cr>
noremap <leader>b :TagbarToggle<CR>

" Variable renaming from http://vim.wikia.com/wiki/Search_and_replace_the_word_under_the_cursor 
:nnoremap <Leader>rr :%s/\<<C-r><C-w>\>//g<Left><Left>
:nnoremap <Leader>rc :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color Scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256                        " force vim to use 256 colors
let g:solarized_termcolors=256      " use solarized 256 fallback
syntax enable
set background=dark
" colorscheme solarized             " leeds to errors

highlight SignColumn ctermbg=234

" Swap words
" http://vim.wikia.com/wiki/Swapping_characters,_words_and_lines
:nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>

" Fast way to run RuboCop
" let g:vimrubocop_config = '~/rubocop/default.yml'
:nnoremap rx :RuboCop<CR>

" tell vim to use the system clipboard 
" to make it work with tmux.
" https://coderwall.com/p/j9wnfw
set clipboard=unnamed

" copy current file name (relative/absolute) to system clipboard
" from: http://stackoverflow.com/questions/916875/yank-file-name-path-of-current-buffer-in-vim
nnoremap <leader>cf :let @*=expand("%")<CR>     " relative path  (src/foo.txt)
nnoremap <leader>cF :let @*=expand("%:p")<CR>   " absolute path  (/something/src/foo.txt)
nnoremap <leader>ct :let @*=expand("%:t")<CR>   " filename       (foo.txt)
nnoremap <leader>ch :let @*=expand("%:p:h")<CR> " directory name (/something/src)

" Adapted from http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text
" replace the current word with the last yanked text
nnoremap SS diw"0P

" Rails short cuts
map <Leader>rs :sp db/schema.rb<cr>
map <Leader>rd :!bundle exec rspec % --format documentation<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE (thanks Gary Bernhardt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Can also be done via Nerdtree
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        nxec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <Leader>rn :call RenameFile()<cr>

"Saves time; maps the spacebar to colon  
nnoremap <space> : 

" Configure splitjoin plugin
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
nnoremap ss :SplitjoinSplit<cr>
nnoremap sj :SplitjoinJoin<cr>
