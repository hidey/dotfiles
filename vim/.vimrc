
set nocompatible               " be iMproved
filetype off                   " required!

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle'))
endif
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()

" let Vundle manage Vundle
" required! 
"Bundle 'gmarik/vundle'

"GitHub
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'mattn/perldoc-vim.git'
NeoBundle 'kana/vim-operator-user.git'
NeoBundle 'kana/vim-operator-replace.git'
NeoBundle 'Shougo/vimproc.git'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'chreekat/vim-instant-markdown'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'koron/codic-vim'
NeoBundle 'rhysd/unite-codic.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'wakatime/vim-wakatime'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tomtom/tcomment_vim'

filetype plugin indent on     " required!
"call pathogen#runtime_append_all_bundles()

syntax on

"##################################
" for tab
"##################################
set shiftwidth=4
set tabstop=4
set expandtab
set number

"##################################
" for search
"##################################
" change grep to ack
set grepprg=ack\ -a

set ignorecase
set smartcase

set hlsearch
noremap <Esc><Esc> :nohlsearch<CR><Esc>

"##################################
" for gui
"##################################
set wildmenu
" status lile
set laststatus=2
"set statusline=%<%f\%m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%{fugitive#statusline()}%4v\ %l/%L
set ambiwidth=double
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'modified': 'MyModified'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction
"function! MyFugitive()
"    return exists('*fugitive#head') ? fugitive#head() : ''
"endfunction

" for screen
set ttymouse=xterm2
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'fugitive': 'MyFugitive',
    \},
    \ 'separator': { 'left': '⮀', 'right': '⮂' },
    \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
\ }

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

" colorscheme
if (has('win32'))
   colorscheme slate
elseif (has('mac'))
   colorscheme wombat256
else
    colorscheme wombat256
endif

" filetype
au BufRead,BufNewFile *.t    set filetype=perl
au BufRead,BufNewFile *.pm    set filetype=perl
au BufNewFile,BufRead *.psgi   set filetype=perl


"##################################
" key mapping
"##################################
noremap ; :

" Unite mappings
noremap ,ue :Unite file_rec<CR>
noremap ,ur :UniteResume<CR>
noremap ,uw :UniteWithBufferDir file<CR>
noremap ,uf :Unite file<CR>
noremap ,ub :Unite buffer<CR>
noremap ,um :Unite file_mru<CR>
noremap ,uc :Unite codic<CR>

if !exists('loaded_matchit')
  " matchitを有効化
  runtime macros/matchit.vim
endif

if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif
