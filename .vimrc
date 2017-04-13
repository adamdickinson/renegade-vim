call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'terryma/vim-multiple-cursors'
call plug#end()


set tabstop=2
set shiftwidth=2
set expandtab
set modifiable
set wildignore+=*.sassc


silent! colorscheme nord 
silent! autocmd vimenter * NERDTree



let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:airline_theme = "hybrid"
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0
let g:jsx_ext_required=0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'



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
  \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" }
  \ }
