let mapleader=" "

autocmd BufWritePre * %s/\s\+$//e

" Enable and disable autocomment
map <leader>c :setlocal formatoptions-=cro<CR>
map <leader>C :setlocal formatoptions=cro<Cr>

" Spellcheck (s to run)
map <leader>s :setlocal spell! spellang=en_us<CR>

" Enable / disable autoindent
map <leader>i :setlocal autoindent<CR>
map <leader>I :setlocal noautoindent<CR>

" Shortcuts in split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Alias for replace all
nnoremap S :%s//gI<Left><Left><Left>

" Basic settings
set mouse=a
syntax on
set ignorecase
set smartcase
set number relativenumber
set encoding=utf8
colorscheme desert

" Tab settings
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set showcmd         " show command in bottom bar
set lazyredraw      " redraw only when we need to.
set laststatus=2    " fix statusbar
set noshowmode      " get rid of default -- INSERT --

" Autocomplete
set wildmode=longest,list,full

" Fix splitting
set splitbelow splitright

" Plugins

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

call plug#end()

if !has('gui_running')
  set t_Co=256
endif

" lightline.vim config
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

