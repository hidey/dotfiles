
set nocompatible               " be iMproved
filetype off                   " required!

" vim-plug 自動インストール
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Git
Plug 'tpope/vim-fugitive'

" ステータスライン
Plug 'itchyny/lightline.vim'

" ファイルツリー
Plug 'scrooloose/nerdtree'

" 編集補助
Plug 'tpope/vim-endwise'
Plug 'tomtom/tcomment_vim'

" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'

" 時間トラッキング
Plug 'wakatime/vim-wakatime'

" カラースキーム
Plug 'jeffreyiacono/vim-colors-wombat'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'

" ファジーファインダー
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" LSP補完/Lint/定義ジャンプ
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

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
" ripgrep を使用
set grepprg=rg\ --vimgrep
set grepformat=%f:%l:%c:%m

set ignorecase
set smartcase

set hlsearch
noremap <Esc><Esc> :nohlsearch<CR><Esc>

"##################################
" for gui
"##################################
set wildmenu
" status line
set laststatus=2
set ambiwidth=double

" colorscheme
if (has('win32'))
   colorscheme slate
elseif (has('mac'))
   colorscheme wombat
else
    colorscheme wombat
endif

" filetype
au BufRead,BufNewFile *.md      set filetype=markdown

let g:vim_markdown_folding_disabled = 1

"##################################
" coc.nvim 設定
"##################################
set updatetime=300
set signcolumn=yes

" coc.nvim キーマッピング
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

"##################################
" key mapping
"##################################
noremap ; :

" fzf.vim マッピング
noremap ,f :Files<CR>
noremap ,F :Files %:p:h<CR>
noremap ,b :Buffers<CR>
noremap ,h :History<CR>
noremap ,r :Rg<CR>

if !exists('loaded_matchit')
  " matchitを有効化
  runtime macros/matchit.vim
endif

if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif
