
set nocompatible               " be iMproved
filetype off                   " required!

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle'))
endif

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
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'marcus/rsense'
NeoBundle 'supermomonga/neocomplete-rsense.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'
NeoBundle 'szw/vim-tags'
NeoBundle 'wakatime/vim-wakatime'

" markdown
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" color scheme
NeoBundle 'jeffreyiacono/vim-colors-wombat'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'

filetype plugin indent on     " required!

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
set ambiwidth=double

" Powerline
let g:Powerline_symbols = 'fancy'

" colorscheme
if (has('win32'))
   colorscheme slate
elseif (has('mac'))
   colorscheme wombat
else
    colorscheme wombat
endif

" filetype
au BufRead,BufNewFile *.t       set filetype=perl
au BufRead,BufNewFile *.pm      set filetype=perl
au BufNewFile,BufRead *.psgi    set filetype=perl
au BufRead,BufNewFile *.md      set filetype=markdown


let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:vim_markdown_folding_disabled = 1

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
