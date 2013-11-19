
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

filetype plugin indent on     " required!
"call pathogen#runtime_append_all_bundles()

set t_Co=256
colorscheme  wombat256
set wildmenu
au BufRead,BufNewFile *.t    set filetype=perl
au BufRead,BufNewFile *.pm    set filetype=perl

" Unite mappings
noremap ,ue :Unite file_rec<CR>
noremap ,ur :UniteResume<CR>
noremap ,uw :UniteWithBufferDir file<CR>
noremap ,uf :Unite file<CR>
noremap ,ub :Unite buffer<CR>
noremap ,um :Unite file_mru<CR>

