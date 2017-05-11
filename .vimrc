call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'terryma/vim-multiple-cursors'
Plug 'Valloric/YouCompleteMe'
call plug#end()


set tabstop=2
set shiftwidth=2
set expandtab
set modifiable
set wildignore+=*.sassc,*/node_modules/*
set diffopt=vertical,icase
set previewheight=20
set showtabline=2
set number


silent! colorscheme nord 
silent! autocmd vimenter * NERDTree

hi DiffAdd ctermfg=0 ctermbg=2
hi DiffChange ctermfg=0 ctermbg=3
hi DiffDelete ctermfg=0 ctermbg=1
hi DiffText ctermfg=0 ctermbg=13



let mapleader = " "
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=


set hidden
nmap <leader>T :enew<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bp :vp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>




let g:lightline = {
  \ 'colorscheme': 'nord',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
  \   'right': [ [ 'filetype' ] ]
  \ },
  \ 'component': {
  \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
  \ },
  \ 'component_visible_condition': {
  \   'readonly': '(&filetype!="help"&& &readonly)',
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ },
  \ 'separator': { 'left': "\ue0b0", 'right': "\u2b82" },
  \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
  \ 'tab': {
  \   'active': [ 'tabnum', 'modified' ],
  \   'inactive': [ 'tabnum', 'modified' ]
  \ },
  \ 'tab_component_function': {
  \   'modified': 'lightline#tab#modified',
  \   'readonly': 'lightline#tab#readonly',
  \   'tabnum': 'lightline#tab#tabnum'
  \ }
  \ }
