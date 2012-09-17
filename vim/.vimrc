
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

"GitHub
Bundle 'Shougo/unite.vim.git'
Bundle 'Shougo/vimshell.git'
Bundle 'mattn/perldoc-vim.git'
Bundle 'kana/vim-operator-user.git'
Bundle 'kana/vim-operator-replace.git'
Bundle 'Shougo/vimproc.git'
Bundle 'tpope/vim-fugitive'

filetype plugin indent on     " required!
call pathogen#runtime_append_all_bundles()

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

