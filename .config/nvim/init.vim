set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'sheerun/vim-polyglot'
Plugin 'prettier/vim-prettier'

let g:AutoPairsShortcutFastWrap = ''
Plugin 'dyng/ctrlsf.vim'
nmap <C-S-f> <Plug>CtrlSFPrompt

Plugin 'michaeljsmith/vim-indent-object'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_symbols = get(g:, 'airline_symbols', {})
if has('gui_running')
  let g:airline_symbols.space = "\u3000"
  let g:airline_symbols.branch = "⎇ "
endif

Plugin 'kien/ctrlp.vim'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](node_modules|docs|dist)$',
  \ }

Plugin 'majutsushi/tagbar'
nmap <F6> :TagbarToggle<CR>

Plugin 'gregsexton/MatchTag'

" Syntax highlighting / programming language environments
let g:go_fmt_fail_silently = 1

Plugin 'Matt-Deacalion/vim-systemd-syntax'
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1

" Color schemes
Plugin 'Badacadabra/vim-archery'
Plugin 'hzchirs/vim-material'
Plugin 'arcticicestudio/nord-vim'

call vundle#end()
filetype plugin indent on

" General mappings {{{

" change the mapleader from \ to ,
let mapleader = ','

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Toggle trough buffers
map <F2> :bprevious<CR>
map <F3> :bnext<CR>
imap <F2> <Esc>:bprevious<CR>
imap <F3> <Esc>:bnext<CR>

" Nerd Tree toggling
map <C-b> :NERDTreeToggle<CR>

" close current buffer
map <leader>d :call CleanClose()<CR>

vnoremap <A-c> "+y

" From:
" http://stackoverflow.com/questions/256204/
" close-file-without-quitting-vim-application
function! CleanClose()
  let todelbufNr = bufnr('%')
  let newbufNr = bufnr('#')
  if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
    exe 'b'.newbufNr
  else
    bnext
  endif

  if (bufnr('%') == todelbufNr)
    new
  endif
  exe 'bd'.todelbufNr
endfunction

" Leader q closes window
nnoremap <Leader>q :q<CR>

" Disable insert when Double mousepad click
map  <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
map  <2-MiddleMouse> <Nop>
imap <2-MiddleMouse> <Nop>
map  <3-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
map  <4-MiddleMouse> <Nop>
imap <4-MiddleMouse> <Nop>


" vertical window split
noremap <leader>v <C-w>v

" horizontal window split
noremap <leader>s <C-w>s
" }}}

" General settings (Need cleanup) {{{
set hidden " open new file without saving current buffer (no more !-error)
set smartcase

set listchars=tab:▸\ ,trail:·
set list

set history=200             " remember commands and search history
set undolevels=1000         " use many muchos levels of undo

set wildmode=longest,list,full
set wildmenu
set ruler

" Ignore certain filetypes (very handy when using ctrl+p) {{{
set wildignore+=*.swp,*.bak,*.*~,*.orig                 " Backup files
set wildignore+=*.o,*.d,*.obj,*.pyc,*.class,*.exe,*.dll " Binary files
set wildignore+=*.icns,*.ico,*.icontainer               " Icon files
set wildignore+=*.png,*.jpg,*.JPG,*.gif                 " image files
set wildignore+=*.eps,*.pdf,*.PDF,*.dvi,*.ps            " Graphic files
set wildignore+=*.svg,*.psd,*.ai,*.xbm                  " graphic
set wildignore+=*.doc,*.docx,*.ppt,*.xls,*.xlsx         " Documents (MS)
set wildignore+=*.odt,*.ods,*.odp                       " Documents (OO)
set wildignore+=*.aux,*.out                             " latex trash
set wildignore+=*.po,*.mo,*.pot                         " Translation files
set wildignore+=*.sln                                   " App specific
set wildignore+=*.ttf,*.otf                             " Fonts
set wildignore+=*.mp3,*.m4a                             " Audio
set wildignore+=*.hi,*.beam                             " Other
" }}}

set title           " change the terminal's title

" Vim UI {
" Highlight current column, and enable toggle.
set cursorline
nnoremap <F9> :set nocursorline!<CR>
set incsearch       " Highlight as you type search phrase.
set laststatus=2    " Always show the status line.
set encoding=utf-8  " Necessary to show unicode glyphs
" disable search highlight
nnoremap <CR> :noh<CR><CR>

set number          " Turn on line numbers.
set mouse=a         " Enable mouse in terminal emulators.
set showcmd         " Show the command being typed.

set nofoldenable    " Don't fold.
" tab/spaces settings (important for python)
" tab = 2 space
" set smartindent " (use autoindent because 'smart' fucks up python)
set nosmartindent
set tabstop=2
set shiftwidth=2
set expandtab
set textwidth=79
set colorcolumn=80
set autoindent
set noshowmode

" Don't backup files.
set nobackup
set noswapfile
" }}}

if &t_Co > 2 || has('gui_running')
  syntax enable " enable syntax highlighting, when the terminal has colors.
endif

if has('nvim')
  " set termguicolors
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

  " set t_Co=256
  " set background=dark
  colorscheme nord
endif

if has('gui_running')
  set background=dark
  colorscheme archery
  set guifont=SauceCodePro\ Nerd\ Font\ Semibold\ 10

  " Remove gvim UI
  set go-=T                     " hide gvim toolbar.
  set go-=m                     " hide gvim menu.
  set guioptions+=LlRrb         " Hide scrollbars,
  set guioptions-=LlRrb         " Gvim need this stupid fix.
endif
" }}}

" filetype settings {{{
" css/sass/less
au FileType css,sass,haml,scss,less setl sw=2 ts=2
" js
au FileType javascript,coffee setl sw=2 ts=2
" json
au FileType json setl sw=2 ts=2
" vim script
au FileType vim setl sw=2 ts=2
"  COMMIT_EDITMSG
au FileType gitcommit setl tw=72 cc=73
" gitconfig
au FileType gitconfig setl ts=8 sts=8 sw=8 noexpandtab
" html
au FileType html,htmldjango setl sw=2 ts=2 tw=0 cc=0
" jade
au FileType jade setl tw=0 cc=120
" tex
au FileType tex setl sw=2 ts=2 makeprg=make\ -C\ %:h
" Makefile
au FileType make,cmake setl ts=8 sts=8 sw=8 noexpandtab nolist
" Javascript
au FileType javascript setl sw=2 ts=2
" coffeescript
au FileType coffee setl sw=2 ts=2 tw=80 cc=81
" YAML
au FileType yaml setl sw=2 ts=2 tw=80 cc=81
" C
au FileType c,cpp setl ts=8 sts=8 sw=8 noexpandtab nolist
" Java
au FileType java setl ts=8 sts=8 sw=8 noexpandtab nolist
" ant
au FileType ant setl sw=2 ts=2
" Go
au FileType go setl ts=8 sts=8 sw=8 noexpandtab nolist
" au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
" au FileType go nmap <Leader>gd <Plug>(go-doc)
" au FileType go nmap <Leader>gd <Plug>(go-decls)
" au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>gl <Plug>(go-lint)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>gv <Plug>(go-vet)
au FileType go nmap <leader>gi :call go#fmt#Format(1)<CR>:w<CR>
" }}}

