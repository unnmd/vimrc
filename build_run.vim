" ~/.vim/plugin/build_run.vim
if exists('g:loaded_build_run_f5')
  finish
endif
let g:loaded_build_run_f5 = 1

" Направление сплитов удобное для терминала
set splitbelow
set splitright

" -------------------- Глобальные (через g:) для колбэков --------------------
let g:build_run_last_term_buf = -1
let g:build_run_last_job_id   = -1
let g:build_run_last_script   = ''
let g:build_run_origin_winid  = -1
let g:build_run_origin_bufnr  = -1

" 1 — сразу вернуть фокус в код после старта (терминал остаётся работать снизу)
let g:build_run_focus_code_after_start = 1

" -------------------- Утилиты --------------------
function! s:KillPrevTerm() abort
  " Остановить предыдущий job
  if has('nvim')
    if g:build_run_last_job_id > 0
      call jobstop(g:build_run_last_job_id)
    endif
  else
    if g:build_run_last_term_buf > 0 && bufexists(g:build_run_last_term_buf)
      try
        let l:job = term_getjob(g:build_run_last_term_buf)
        if type(l:job) == type(0) && l:job > 0
          call job_stop(l:job)
        elseif type(l:job) == type({})
          call job_stop(l:job)
        endif
      catch
      endtry
    endif
  endif

  " Закрыть буфер терминала
  if g:build_run_last_term_buf > 0 && bufexists(g:build_run_last_term_buf)
    execute 'silent! bd!' g:build_run_last_term_buf
  endif
  let g:build_run_last_term_buf = -1
  let g:build_run_last_job_id   = -1

  " Удалить временный скрипт
  if !empty(g:build_run_last_script) && filereadable(g:build_run_last_script)
    call delete(g:build_run_last_script)
  endif
  let g:build_run_last_script = ''
endfunction

function! s:OnTermClose() abort
  " Удалить временный скрипт
  if !empty(g:build_run_last_script) && filereadable(g:build_run_last_script)
    call delete(g:build_run_last_script)
  endif
  let g:build_run_last_script = ''

  " Вернуть фокус в исходное окно
  if g:build_run_origin_winid > 0 && win_id2win(g:build_run_origin_winid) > 0
    stopinsert
    call win_gotoid(g:build_run_origin_winid)
  endif
endfunction

" Глобальный колбэк для Vim8 term_start() (exit_cb вызывает именно global-функции)
function! BuildRun_OnExit(job, status) abort
  " job/status можно игнорировать; нам нужно лишь вернуть фокус и убрать скрипт
  call <SID>OnTermClose()
endfunction

" -------------------- Запуск в терминале --------------------
function! s:TermRun(cmd) abort
  " Нет терминала вовсе? Фоллбэк
  if !has('nvim') && !has('terminal')
    execute '!' . a:cmd
    return
  endif

  " Убить предыдущий запуск
  call s:KillPrevTerm()
  " Временный скрипт — печатаем код выхода при любом завершении (в т.ч. при kill)
  let l:script = tempname()
  call writefile([
        \ '#!/bin/sh',
        \ 'trap ''st=$?; printf "\nProgram ended with exit code: %d\n" "$st"'' EXIT',
        \ a:cmd
        \ ], l:script)
  if exists('*setfperm')
    call setfperm(l:script, 'rwx------')
  else
    call system('chmod 700 ' . shellescape(l:script))
  endif
  let g:build_run_last_script = l:script

  " Окно терминала снизу (10 строк)
  botright split | resize 5

  if has('nvim')
    let g:build_run_last_term_buf = bufnr('%')
    let g:build_run_last_job_id   = termopen([l:script])

    " Возврат фокуса при закрытии (если событие есть)
    augroup BuildRunTermClose
      autocmd!
      if exists('##TermClose')
        autocmd TermClose * if bufnr() == g:build_run_last_term_buf | call <SID>OnTermClose() | endif
      endif
    augroup END
    startinsert
  else
    " Vim8: используем term_start с exit_cb => гарантированный возврат фокуса
    " Открываем терминал в текущем окне (curwin) и задаем высоту
    let l:opts = {'curwin': 1, 'term_rows': 10, 'exit_cb': 'BuildRun_OnExit'}
    let l:job  = term_start([l:script], l:opts)
    let g:build_run_last_term_buf = bufnr('%')
    if type(l:job) == type(0)
      let g:build_run_last_job_id = l:job
    elseif type(l:job) == type({})
      let g:build_run_last_job_id = 1
    endif
    " В Vim8 терминал сразу в Terminal-режиме
    startinsert
  endif

  " Сразу вернуть фокус в код, если включено
  if get(g:, 'build_run_focus_code_after_start', 0)
    stopinsert
    if g:build_run_origin_winid > 0 && win_id2win(g:build_run_origin_winid) > 0
      call win_gotoid(g:build_run_origin_winid)
    else
      silent! wincmd p
    endif
  endif
endfunction

" -------------------- Построение команд --------------------
function! s:BuildRunCpp() abort
  let l:dir  = expand('%:p:h')
  let l:base = expand('%:t')
  let l:out  = expand('%:t:r')

  if filereadable(l:dir . '/Makefile') || filereadable(l:dir . '/makefile')
    return printf(
          \ 'cd %s && make -j && { [ -x %s ] && ./%s || { [ -x a.out ] && ./a.out || echo "Build done. Run manually."; }; }',
          \ shellescape(l:dir),
          \ shellescape(l:out),
          \ shellescape(l:out)
          \ )
  endif

  return printf(
        \ 'cd %s && g++ -std=c++20 -O2 -Wall -Wextra -g %s -o %s && ./%s',
        \ shellescape(l:dir),
        \ shellescape(l:base),
        \ shellescape(l:out),
        \ shellescape(l:out)
        \ )
endfunction

function! s:BuildRunPy() abort
  let l:dir  = expand('%:p:h')
  let l:base = expand('%:t')
  return printf('cd %s && python3 %s', shellescape(l:dir), shellescape(l:base))
endfunction

" -------------------- Главный обработчик F5 --------------------
function! s:BuildRunF5() abort
  " Запомнить исходное окно/буфер
  let g:build_run_origin_winid = win_getid()
  let g:build_run_origin_bufnr = bufnr('%')

  " Сохранить файл
  if &modifiable && &buftype ==# ''
    silent write
  endif

  " Выбор по filetype
  let l:ft = &filetype
  if l:ft =~# '^\%(c\|cpp\|objc\|objcpp\)$'
    call s:TermRun(s:BuildRunCpp())
  elseif l:ft ==# 'python'
    call s:TermRun(s:BuildRunPy())
  else
    echo "Build&Run: не знаю, как запускать filetype=" . l:ft
  endif
endfunction

" --- Остановить текущий запуск (для F6) ---
function! s:StopRun() abort
  " мягкий вывод в командную строку
  echo "Build&Run: stopping..."
  call s:KillPrevTerm()
endfunction
 
" -------------------- Маппинги F5 --------------------
" В Normal-режиме — всегда
nnoremap <silent> <F5> :call <SID>BuildRunF5()<CR>

" В Insert-режиме — выйти в Normal и запустить
inoremap <silent> <F5> <Esc>:call <SID>BuildRunF5()<CR>

" В терминале
if has('nvim')
  " Neovim: есть TermOpen и tnoremap — F5 работает прямо из terminal-mode
  augroup BuildRunF5TermKey
    autocmd!
    autocmd TermOpen * tnoremap <buffer> <silent> <F5> <C-\><C-n>:call <SID>BuildRunF5()<CR>
  augroup END
else
  " Vim8: если есть tnoremap — выходим в Normal-mode терминала и запускаем
  if exists(':tnoremap')
    augroup BuildRunF5TermKey
      autocmd!
      autocmd BufEnter * if &buftype ==# 'terminal' | tnoremap <buffer> <silent> <F5> <C-W>N:call <SID>BuildRunF5()<CR> | endif
    augroup END
  else
    " Совсем старый Vim8: F5 в терминале работает из Normal-mode буфера
    augroup BuildRunF5TermKey
      autocmd!
      autocmd BufEnter * if &buftype ==# 'terminal' | nnoremap <buffer> <silent> <F5> :call <SID>BuildRunF5()<CR> | endif
    augroup END
  endif
endif

" ---- Маппинги F6 (Stop) ----
" Normal-mode
nnoremap <silent> <F6> :call <SID>StopRun()<CR>
" Insert-mode
inoremap <silent> <F6> <Esc>:call <SID>StopRun()<CR>

if has('nvim')
  " Neovim: F6 работает прямо из terminal-mode
  augroup BuildRunStopTermKey
    autocmd!
    autocmd TermOpen * tnoremap <buffer> <silent> <F6> <C-\><C-n>:call <SID>StopRun()<CR>
  augroup END
else
  " Vim8: если есть tnoremap — выходим в Normal и стопим; иначе — из Normal-mode терминала
  if exists(':tnoremap')
    augroup BuildRunStopTermKey
      autocmd!
      autocmd BufEnter * if &buftype ==# 'terminal' | tnoremap <buffer> <silent> <F6> <C-W>N:call <SID>StopRun()<CR> | endif
    augroup END
  else
    augroup BuildRunStopTermKey
      autocmd!
      autocmd BufEnter * if &buftype ==# 'terminal' | nnoremap <buffer> <silent> <F6> :call <SID>StopRun()<CR> | endif
    augroup END
  endif
endif



