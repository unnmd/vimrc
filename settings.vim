"__      _______ __  __    _____      _   _   _                 
 "\ \    / /_   _|  \/  |  / ____|    | | | | (_)                
  "\ \  / /  | | | \  / | | (___   ___| |_| |_ _ _ __   __ _ ___ 
   "\ \/ /   | | | |\/| |  \___ \ / _ \ __| __| | '_ \ / _` / __|
    "\  /   _| |_| |  | |  ____) |  __/ |_| |_| | | | | (_| \__ \
     "\/   |_____|_|  |_| |_____/ \___|\__|\__|_|_| |_|\__, |___/
                                                       "__/ |    
                                                      "|___/     

" mouse=nicr - позволяет использовать мышь в нормальном, визуальном, командном и режиме вставки
set mouse=nicr
" laststatus=1 - отображает строку состояния только если открыто более одного окна
"set laststatus=1
" устанавливает кодировку символов UTF-8
set enc=utf-8

set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<> 
  
nmap Ж : 
" yank 
nmap Н Y 
nmap з p 
nmap ф a 
nmap щ o 
nmap г u 
nmap З P
nmap ёё \
nmap ее tt

set spell spelllang=en_us,ru_ru

" Очистка выделений поиска
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[] ]

" cursorline включает подсветку текущей строки
" listchars включает отображение невидимых символов
" list включает отображение невидимых символов
" cursorcolumn включает подсветку текущей колонки
set listchars=tab:\|\ 
set list
"set cursorcolumn
"set cursorline

" параметры обратного удаления (backspace) для редактирования текста. 
" Значение "indent" позволяет удалить пробелы, созданные при нажатии клавиши Tab для отступов. 
" Значение "eol" позволяет удалить символы в конце строки. 
" Значение "start" позволяет удалить символы в начале строки. 
set cul backspace=indent,eol,start

" set number устанавливает отображение номеров строк в редакторе,
" set nu
" relativenumber позволяет отображать номера строк относительно текущей строки.
set rnu nu
" history устанавливает количество сохраняемых команд в истории команд.
set history=1000

" позволяет выделять различные элементы кода разными цветами, что делает его
" более читабельным и удобным для работы
syntax on

" expandtab говорит Vim использовать пробелы вместо табуляции
" tabstop, shiftwidth и softtabstop устанавливают количество пробелов, которые будут использоваться для отступов.
" textwidth определяет максимальную длину строки текста
" colorcolumn устанавливает вертикальную линию на 80-м символе
" autoindent и smartindent устанавливают автоматическое добавление отступов при переходе на новую строку 
set et ts=4 sts=4 sw=4 tw=120 cc=120 ai si
autocmd FileType cpp setlocal tw=80 cc=80
" Устанавливает цвет вертикальной линии
highlight ColorColumn ctermbg=DarkGray guibg=LightGray
" очищает стиль подсветки для неправильно написанных слов, если он был 
" установлен ранее.
highlight clear SpellBad
" определяет стиль подсветки для неправильно написанных слов, в данном случае, 
" это подчеркивание и курсивный шрифт.
highlight SpellBad cterm=underline,italic gui=underline,italic

set clipboard=unnamed

" incsearch включает инкрементальный поиск в Vim, который отображает результаты поиска по
" мере ввода символов.
" hlsearch включает подсветку результатов поиска
set is hls 
" определяет стиль подсветки результатов поиска
highlight Search ctermbg=LightYellow ctermfg=Red cterm=bold,italic guibg=LightYellow guifg=Red gui=bold,italic

" matchpairs определяет пары символов, для которых будет автоматически выделяться 
" закрывающий символ при его вводе. В данном случае, это угловые скобки 
" и двоеточие.
set mps+=<:>
" определяет стиль подсветки для выделенных пар символов, в данном случае, это
" зеленый фон и синий шрифт
highlight MatchParen ctermbg=green ctermfg=blue guibg=green guifg=blue

" устанавливает открытие новых вертикальных окон терминала Vim справа от текущего окна
set splitright 

" создает резервные копии файлов
set backup
set backupdir=~/.vim/backup/
" создает резервную копию файла перед его сохранением, чтобы сохранить 
" предыдущую версию файла
set writebackup
" перезаписывает оригинальный файл резервной копией при сохранении
set backupcopy=yes 
" устанавливает формат имени резервной копии в формате filename@2015-04-05.14:59.
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")
" устанавливает открытие новых окон терминала Vim в нижней части экрана
set splitbelow


" Fix crazy wrong code, ref to:
" https://www.reddit.com/r/vim/comments/gv410k/strange_character_since_last_update_42m/fsmfxxv/
" убирают проблемы с неправильным отображением кодировки 
let &t_TI = ""
let &t_TE = ""
