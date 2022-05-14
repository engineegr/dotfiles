set clipboard=unnamedplus

" turn on vim-pathogen plugin
" lets you keep plugins in subdirectories of .vim/bundle/
" see https://github.com/tpope/vim-pathogen

" required for Vundle
filetype off
set nocompatible

set backup                      " delete old backup
set writebackup                 " backup current file
set directory=~/.vim/tmp        " dir for swap files
set backupdir=~/.vim/tmp
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smartindent
set expandtab
set backspace=indent,eol,start
set mouse-=a
syntax enable
set nospell
set cursorline
set wildmenu
set showmatch
set number
set smartcase
set incsearch
set whichwrap=b,s,<,>,[,]
"set autoindent
set autoread
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
" Enable folding
" @see https://realpython.com/vim-and-python-a-match-made-in-heaven/
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za
" <CR> return carriage
" <C-x> ctrl - x
" <S> 'Shift'
" <leader> \
" nmap \q :nohlsearch<CR>
nnoremap \q :<C-u>nohlsearch<CR>
" nnoremap <CR> G
nnoremap gV `[v`]
nnoremap <leader>k :sus<CR>
" nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nmap <leader>e <Nop>
nmap <leader>e :Ex<CR>

" Create new horizontal window
nnoremap <leader>n :new<CR>
" Create new vertical windows
nnoremap <leader>v :vnew<CR>

" Left
map <Esc>h <C-w>h
" Right
map <Esc>l <C-w>l
" Up
map <Esc>k <C-w>k
" Down
map <Esc>j <C-w>j
" add/delete line
nnoremap - dd
vnoremap - dd
vnoremap + o
nnoremap + o
"vnoremap = o
"nnoremap = o
" Replace line
noremap rl <S-V>p
" Replace word (register: 0)
noremap rw cw<C-r>0<Esc>
" Enter in normal mode by <Esc>o
inoremap <Esc>o <C-o>
" Jump to prev/next paragraph
inoremap <Esc>[ <C-o>{
inoremap <Esc>] <C-o>}

" write change and exit
nnoremap <S-u> :so ~/.vimrc<CR>
nnoremap <S-x> :x<CR>
nnoremap <S-q> <Nop>
nnoremap <S-q> :q!<CR>
nnoremap <S-w> :w<CR>
" buffers
" previously view buffer
nnoremap <C-e> :e#<CR>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>
nnoremap <C-l> :ls<CR>
" Just press buffer number and Shift-L
nmap <S-l> <Nop>
nmap <S-l> :<C-u>execute 'b' (v:count)<cr>
" Key bind for fzf
nmap <S-t> <Nop>
nmap <S-t> :Files<CR>
nmap <leader>r :Tags<CR>
" next change ]c
" previous change [c
" diff obtain do
" diff put dp
" fold open zo
" fold close zc
" rescan files :diffupdate
nnoremap <leader>c :windo diffthis<CR>
nnoremap ce :windo diffoff<CR>
"inoremap <F2> <C-R>=expand('%:p:h')<CR>
inoremap <F2> <C-R>=expand('%')<CR>
"
" statusline
" format markers:
"   %< truncation point
"   %n buffer number
"   %f relative path to file
"   %m modified flag [+] (modified), [-] (unmodifiable) or nothing
"   %r readonly flag [RO]
"   %y filetype [ruby]
"   %= split point for left and right justification
"   %-35. width specification
"   %l current line number
"   %L number of lines in buffer
"   %c current column number
"   %V current virtual column number (-n), if different from %c
"   %P percentage through buffer
"   %) end of width specification
"   %L Common number of rows
 set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" Good example of status line https://nkantar.com/blog/my-vim-statusline
" display statusline always
 set statusline=
set laststatus=2
set t_Co=256
set statusline=%<%F
set statusline+=%30.(%y\[m:%{mode()}\]\[bf:%{winnr()}\]%m%r%)
" 
" Recommended settings for syntastic plugin
set statusline+=#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" 
" strftime - display time string, see
" https://vimhelp.org/eval.txt.html#strftime%28%29
set statusline+=%=%-14.(%{strftime('%Y\ %b\ %d\ %X')}\ %l,%c%V%)\ \[%P/%L\]
" 
" Works in vim > 7 ver ONLY.
let s:timer_rt=timer_start(1000, {-> execute(':let &stl=&stl')}, {'repeat': -1})
" Backup / Swap / Undo config
let vim_tmp=expand('~/.vim/tmp')
if !filereadable(vim_tmp)
silent !mkdir -p ~/.vim/tmp
endif

function! SetExecutableBit()
  let fname = expand("%:p")
  checktime
  execute "au FileChangedShell " . fname . " :echo"
  silent !chmod a+x %
  execute ":redraw!"
  checktime
  execute "au! FileChangedShell " . fname
endfunction

command! Xbit call SetExecutableBit()
nmap sx :Xbit<CR>

set rtp+=~/.vim/bundle/Vundle.vim
" Turn on fzf
" If installed using git
set rtp+=~/.fzf
set rtp+=~/.vim/plugin/setcolors.vim
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
" vim-pluggin
call vundle#begin('~/.vim/bundle')
" Initialize plugin system
  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'junegunn/fzf'
  Plugin 'junegunn/fzf.vim'
  Plugin 'haya14busa/incsearch.vim'
  Plugin 'zhou13/vim-easyescape'
  Plugin 'Chiel92/vim-autoformat'
  Plugin 'sheerun/vim-polyglot'
  Plugin 'stephpy/vim-yaml'
  Plugin 'vim-scripts/indentpython.vim'
  " Plugin 'Valloric/YouCompleteMe'
  Plugin 'ajh17/VimCompletesMe'
  Plugin 'vim-syntastic/syntastic'
  " Plugin 'vim-vdebug/vdebug'
  " Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
  Plugin 'ryanoasis/vim-devicons'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'enricobacis/vim-airline-clock'
  Plugin 'jnurmine/Zenburn'
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'scrooloose/nerdtree'
call vundle#end()

" Plug 'haya14busa/incsearch.vim'
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map s* <Plug>(incsearch-nohl-s*)
map s# <Plug>(incsearch-nohl-s#)

"Plug 'zhou13/vim-easyescape'
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 2000
cnoremap jk <ESC>
cnoremap kj <ESC>

noremap <Esc>, :Autoformat<CR>
let g:autoformat_autoindent = 1
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
" Use of the tuned .sh format util (Google Style: https://google.github.io/styleguide/shell.xml)
let g:formatdef_my_custom_sh = '"shfmt -i 2 -ci"'
let g:formatters_sh = ['my_custom_sh']
let g:formatter_yapf_style = 'pep8'

" YouCompleteMe
" @link https://github.com/ycm-core/YouCompleteMe
" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Synastic
" @link https://github.com/vim-syntastic/syntastic
" Open/Close Error windows
noremap <Esc>[ :Errors<CR>
noremap <Esc>] :lclose<CR>
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" au BufReadPost,BufNewFile,BufWrite *.sh execute "normal gg=G"
au BufReadPost,BufNewFile,BufWrite *.sh :Autoformat
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/bundle/vim-yaml/after/syntax/yaml.vim
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/bundle/vim-yaml/after/ftplugin/yaml.vim

" unnecessary white spaces
" @see
" https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
function! TrimBlankLinesAndWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  keeppatterns %s#\($\n\s*\)\+\%$##
  call winrestview(l:save)
endfunction

" hide YouAutocomplete 
" https://github.com/ycm-core/YouCompleteMe/issues/662
command! HideYC call youcompleteme#DisableCursorMovedAutocommands()
nnoremap <Esc>q :call HideYC()<CR>

" Powerline 
" Setup airline
let g:airline#extensions#tabline#enabled = 1
" Display time (use vim-airline-clock plugin)
" let g:airline#extensions#clock#format = '%H:%M:%S'
let g:airline#extensions#clock#format = '%Y %b %d %X'
" transform the func to command (to call it as :TrimWhitespace
command! TrimBlankLinesAndWhitespace call TrimBlankLinesAndWhitespace()
au BufNewFile,BufWrite *.py,*.pyw,*.c,*.h :call TrimBlankLinesAndWhitespace()<CR>
nnoremap <Esc>w :call TrimBlankLinesAndWhitespace()<CR>
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" autocmd FileType python map <buffer> <Esc>l :call flake8#Flake8()<CR>
" autocmd BufWritePost *.py call flake8#Flake8()
let python_highlight_all=1

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

" https://www.cheatography.com/stepk/cheat-sheets/vim-nerdtree/
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>

highlight Visual ctermbg=238
highlight Comment ctermfg=Gray
highlight MatchParen cterm=none ctermbg=green ctermfg=yellow

filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting
