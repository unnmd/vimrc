  "_  __            __  __          _____  
 "| |/ /           |  \/  |   /\   |  __ \ 
 "| ' / ___ _   _  | \  / |  /  \  | |__) |
 "|  < / _ \ | | | | |\/| | / /\ \ |  ___/ 
 "| . \  __/ |_| | | |  | |/ ____ \| |     
 "|_|\_\___|\__, | |_|  |_/_/    \_\_|     
            "__/ |                         
           "|___/                          

nnoremap <leader>o :only<CR>
nnoremap <leader>e :tabedit<CR>
nnoremap <leader>R :so<CR>

nnoremap <leader>w :w!<CR>
nnoremap <C-s> :w!<CR>
nnoremap <leader>Q :Q<CR>
nnoremap <leader>q :q!<CR>

nnoremap <leader>ц :w!<CR>
nnoremap <leader>й :q!<CR>

" gf в новом табе
nnoremap <leader>t :tabedit <cfile><CR>

" gf в сплите
nnoremap <leader>s :split <cfile><CR>
nnoremap <leader>v :vsplit <cfile><CR>


" В нормальном режиме J/K двигают строку
nnoremap _  :m .-2<CR>==
nnoremap + :m .+1<CR>==
" В визуальном режиме J/K двигают выделение
vnoremap + :m '>+1<CR>gv=gv
vnoremap _ :m '<-2<CR>gv=gv

" Вставить пустую строку сверху/снизу
nnoremap [o O<Esc>
nnoremap ]o o<Esc>

" Быстрое дублирование строки
nnoremap <leader>d :t.<CR>

" Перемещение по окнам сплитов через Ctrl + hjkl (как tmux)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-w>m  :vnew<CR>   

