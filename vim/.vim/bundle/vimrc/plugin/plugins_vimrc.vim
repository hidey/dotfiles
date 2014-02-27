
" for operator replace
map R <Plug>(operator-replace)

" ref.vim
let g:ref_perldoc_complete_head = 1

" for surround.vim
nmap s <Plug>Ysurround
nmap ss <Plug>Yssurround

" for NERDTree
noremap ,n :NERDTreeToggle<CR>

" Unite mappings
noremap ,ue :Unite file_rec<CR>
noremap ,ur :UniteResume<CR>
noremap ,uw :UniteWithBufferDir file<CR>
noremap ,uf :Unite file<CR>
noremap ,ub :Unite buffer<CR>
noremap ,um :Unite file_mru<CR>

" for Fugitive
noremap ,gd :Gdiff 
noremap ,gdc :Gdiff --cached 
noremap ,gs :Gstatus 
noremap ,gadd :Gwrite 
noremap ,gl :Glog

" for unite window height
let g:unite_winheight=20


" for yanktmp
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

" quickrun.vim
silent! nmap <unique> ,r <Plug>(quickrun)

