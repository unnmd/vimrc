   "_____        __ _      _____           _       _       
  "/ ____|      / _| |    / ____|         (_)     | |      
 "| (___   ___ | |_| |_  | (___   ___ _ __ _ _ __ | |_ ___ 
  "\___ \ / _ \|  _| __|  \___ \ / __| '__| | '_ \| __/ __|
  "____) | (_) | | | |_   ____) | (__| |  | | |_) | |_\__ \
 "|_____/ \___/|_|  \__| |_____/ \___|_|  |_| .__/ \__|___/
                                           "| |            
                                           "|_|            

nnoremap <C-n> :call NERDTreeToggleAndRefresh()<CR>
function NERDTreeToggleAndRefresh()
  :NERDTreeToggle
  if g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
  endif
endfunction


" Highlight all instances of word under cursor
" Type z/ to toggle highlighting on/off.
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>


nnoremap <leader><leader>rn :call RenameFile()<CR>

function! RenameFile()
  let l:old = expand('%')
  let l:new = input('New name: ', l:old, 'file')
  if l:new != ''
    execute 'saveas ' . fnameescape(l:new)
    if filereadable(l:old)
      call delete(l:old)
    endif
    echo 'Renamed to ' . l:new
  endif
endfunction


" Автосохранение при переключении фокуса
augroup autosave
  autocmd!
  autocmd FocusLost,WinLeave * silent! wa
augroup END


