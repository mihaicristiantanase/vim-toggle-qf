" 'q' closes the quickfix and also goes back to the split previouly focused
" TODO: simplify logic with something like: 'nnoremap q call QFHandleQFun()'

function! QFMappingQFun()
  silent! unmap q
  if &filetype == 'qf'
    nnoremap <silent> q p:ccl<CR>
  endif
endfunction

function! QFMappingLeaderQFun()
  silent! unmap <leader>q
  if &filetype == 'qf'
    noremap <silent> <leader>q p:ccl<CR>
  else
    noremap <silent> <leader>q :q!<CR>
  endif
endfunction

function! QFMappingLeaderBQFun()
  silent! unmap <leader>bq
  if &filetype == 'qf'
    noremap <silent> <leader>bq p:ccl<CR>
  else
    noremap <silent> <leader>bq :bd!<CR>
  endif
endfunction

function! QFIsVisibleFFun()
  for i in range(1, winnr('$'))
    let bnum = winbufnr(i)
    if getbufvar(bnum, '&buftype') == 'quickfix'
      return 1
    endif
  endfor
  return 0
endfunction

function! QFToggleFun()
  if QFIsVisibleFFun() == 1
    " current buffer is not quickfix, but quickfix is visible
    if &filetype == 'qf'
      execute 'normal p' | :silent ccl
    else
      :silent ccl
    endif
  else
    " quickfix is not showing
    :bo copen
  endif
endfunction

augroup qf
  autocmd!
  " recording / exit
  autocmd BufReadPost,BufEnter * call QFMappingQFun()
  " quick exit
  autocmd BufReadPost,BufEnter * call QFMappingLeaderQFun()
  " buffer delete
  autocmd BufReadPost,BufEnter * call QFMappingLeaderBQFun()
augroup end

nnoremap <silent> <F5> :call QFToggleFun()<CR>
