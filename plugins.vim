"__      _______ __  __   _____  _             _           
 "\ \    / /_   _|  \/  | |  __ \| |           (_)          
  "\ \  / /  | | | \  / | | |__) | |_   _  __ _ _ _ __  ___ 
   "\ \/ /   | | | |\/| | |  ___/| | | | |/ _` | | '_ \/ __|
    "\  /   _| |_| |  | | | |    | | |_| | (_| | | | | \__ \
     "\/   |_____|_|  |_| |_|    |_|\__,_|\__, |_|_| |_|___/
                                          "__/ |            
                                         "|___/             

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'

"Plug 'mg979/vim-visual-multi'

Plug 'github/copilot.vim'

" Go-комбайн
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }


" Codeium - AI ассистент
"Plug 'Exafunction/codeium.vim'

" Coc - является интегрированной средой разработки (IDE) для Vim
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install() }}

" предоставляет пользователю красивый и информативный интерфейс статусной строки.
Plug 'vim-airline/vim-airline'  " require vim-airline/vim-airline-themes
" содержит большое количество тем оформления для статусной строки.
Plug 'vim-airline/vim-airline-themes'
" добавляет в статусную строку часы с текущим временем.
"Plug 'enricobacis/vim-airline-clock'

" Auto brackets
" автоматически добавляет закрывающие скобки, кавычки и другие символы при 
" вводе открывающих
Plug 'jiangmiao/auto-pairs' 

"For vim-sandwich
" позволяет быстро обрамлять выделенный текст или текущее слово другими 
" символами, такими как кавычки, скобки или HTML-теги.
" Как пользовать:
" sae и нужный символ - вылелить и "окружить" в нужный символ
" sdb - убрать "окружение"
Plug 'machakann/vim-sandwich' 

" nerdtree плагин для навигации по файловой системе внутри Vim
" Как пользовать:
" найти текущий файл в  nerdtree: <leader>n;
" открыть nerdtree: Ctrl-n
Plug 'scrooloose/nerdtree'
" nerdtree-git-plugin расширяет функциональность Nerdtree, добавляя возможность работы с git-репозиториями
Plug 'Xuyuanp/nerdtree-git-plugin'
" плагин для подсветки синтаксиса файлов в дереве файлов NERDTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" nerdcommenter плагин для комментирования кода
Plug 'preservim/nerdcommenter'

" содержит файлы фрагментов для различных языков программирования.
Plug 'honza/vim-snippets' 

"темы 
Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin'  }

" vim-floaterm - плагин для создания терминала во всплывающем окне
Plug 'voldikss/vim-floaterm'

" позволяет быстро перемещаться по файлу с помощью различных маркеров.
Plug 'easymotion/vim-easymotion'

" Vimspector - плагин для отладки
Plug 'puremourning/vimspector'

" Color mark
Plug 'vim-scripts/ingo-library'
Plug 'WanGong/vim-mark'  " require vim-scripts/ingo-library"
 
" Поиск
Plug 'dyng/ctrlsf.vim'

"ALE проверку синтаксиса и семантические ошибки
Plug 'dense-analysis/ale'
"vim-cpp-enhanced-highlight включает дополнительную подсветку синтаксиса
"C++11/14/17
Plug 'octol/vim-cpp-enhanced-highlight'
"python-syntax включает дополнительную подсветку синтаксиса
Plug 'vim-python/python-syntax'

Plug 'ryanoasis/vim-devicons'
Plug 'preservim/tagbar'

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'  " require fugitive
Plug 'airblade/vim-gitgutter'

"Indent Guides - это плагин для визуального отображения уровней отступов
Plug 'Yggdroot/indentLine'

Plug 'rhysd/vim-clang-format'

Plug 'junegunn/goyo.vim' 

Plug 'psf/black'

Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
call plug#end()
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
 
" Brief help
" :PlugList       - lists configured plugins
" :PlugInstall    - installs plugins; append `!` to update or just :PlugUpdate
" :PlugSearch foo - searches for foo; append `!` to refresh local cache
" :PlugClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
"


  "_____  _             _              _____      _   _   _                 
 "|  __ \| |           (_)            / ____|    | | | | (_)                
 "| |__) | |_   _  __ _ _ _ __  ___  | (___   ___| |_| |_ _ _ __   __ _ ___ 
 "|  ___/| | | | |/ _` | | '_ \/ __|  \___ \ / _ \ __| __| | '_ \ / _` / __|
 "| |    | | |_| | (_| | | | | \__ \  ____) |  __/ |_| |_| | | | | (_| \__ \
 "|_|    |_|\__,_|\__, |_|_| |_|___/ |_____/ \___|\__|\__|_|_| |_|\__, |___/
                  "__/ |                                           __/ |    
                 "|___/                                           |___/     


let g:vimspector_base_dir = '/Users/unnmd/.vim/plugged/vimspector'

" Явно укажем интерпретатор
let g:vimspector_python = expand('~/.vim/vimspector-py/bin/python')

" И продублируем окружением (важно для GUI-Vim/Neovim)
let $VIMSPECTOR_PYTHON = expand('~/.vim/vimspector-py/bin/python')


" Запуск/подключение дебаг-сессии по активной конфигурации
nnoremap <silent> <F7> :call vimspector#Launch()<CR>

" Удобные клавиши отладки
nnoremap <silent> <F9>   :call vimspector#ToggleBreakpoint()<CR>
nnoremap <silent> <S-F9> :call vimspector#AddFunctionBreakpoint(input('Function: '))<CR>

nnoremap <silent> <F10>  :call vimspector#StepOver()<CR>
nnoremap <silent> <F11>  :call vimspector#StepInto()<CR>
nnoremap <silent> <S-F11>:call vimspector#StepOut()<CR>

" Продолжить / Пауза / Остановить
nnoremap <silent> <leader>dc :call vimspector#Continue()<CR>
nnoremap <silent> <leader>dp :call vimspector#Pause()<CR>
nnoremap <silent> <leader>dq :call vimspector#Reset()<CR>   " стоп и закрыть UI

nnoremap <C-p> :Files<CR>
nnoremap <leader>rg :Rg<Space>

let g:onedark_terminal_italics = 1
let g:gruvbox_italic = 1
" Темы 
"colo gruvbox
"colo onedark
colo catppuccin-frappe
set termguicolors
"set bg=dark
" определяет стиль подсветки для строк, в кавычках -  курсивный шрифт
highlight String cterm=italic gui=italic

" === Go: делегируем LSP/комплишн coc.nvim ===
let g:go_gopls_enabled = 0
let g:go_code_completion_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_fmt_autosave = 0
let g:go_fmt_command = "goimports"   " :GoFmt будет вызывать goimports вручную

" Привязка G-H-P для предварительного просмотра изменений
nnoremap <leader>ghp :GitGutterPreviewHunk<CR>
"
" " Привязка G-H-U для отмены изменений
nnoremap <leader>ghu :GitGutterUndoHunk<CR>

"for clang-format
autocmd BufWritePre *.c,*.cpp,*.h,*.hpp,*.cc,*.cxx,*.hh,*.hxx,*.c++,*.cxx++,*.h++,*.hxx++ :ClangFormat

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

" The plugins for the coc.nvim
let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-clangd',
\ 'coc-tabnine',
\ 'coc-pyright',
\ 'coc-git',
\ '@yaegassy/coc-black-formatter',
\ 'coc-go'
"\ '@yaegassy/coc-mypy',
"\ 'coc-jedi'
\ ]

" COC
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(2) : "\<S-Tab>"
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd ColorScheme * highlight CocHighlightText ctermfg=LightMagenta guifg=LightMagenta cterm=bold gui=bold
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h c nmap <leader>rn <Plug>(coc-rename)oc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" NERDTree
" Как пользовать:
" найти текущий файл в  nerdtree: <leader>n;
" открыть и обновить дерево nerdtree: Ctrl-n
let NERDTreeMinimalUI=1 " remove the first line help info
let NERDTreeWinSize=40  " set width
let NERDTreeHighlightCursorline=1 " does not highlight the cursor of current file
let NERDTreeChDirMode = 2 " setting for current directory
let NERDTreeShowHidden = 1
" Auto quit NERDTree when vim is quited
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

nnoremap <leader>n :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeMapOpenInTab='\r'

" For airline
let g:airline_theme='gruvbox'                                                                                                             
let g:airline_powerline_fonts = 1                                                                                                         
let g:airline_theme='catppuccin'

"let g:airline_section_b = '%{fugitive#statusline()} %{getcwd()}' " in section B of the status line display the CWD                                                 

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.paste = 'ρ'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right                                                           
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline                                  
let g:airline#extensions#coc#show_coc_status=1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = '✗: '
let g:airline#extensions#ale#warning_symbol = '⚠ : '
let g:airline#extensions#ale#show_line_numbers = 1
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline_skip_empty_sections = 1
let g:airline_stl_path_style = 'short'
let g:airline_section_c = '%t'
let g:airline_section_error = ''
let g:airline_section_warning = ''

function! AirlineInit()
    call airline#parts#define_raw('linenr', '%l')
    call airline#parts#define_accent('linenr', 'bold')
    let g:airline_section_z = airline#section#create(['%3p%% ', g:airline_symbols.linenr, 'linenr', ':%c'])
endfunction
autocmd VimEnter * call AirlineInit()

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab


" 'voldikss/vim-floaterm'
" Usage: (1) toggle floaterm: tt;
let g:floaterm_keymap_new    = '<leader>tt'
let g:floaterm_keymap_kill   = '<leader>tk'
let g:floaterm_keymap_prev   = '<leader>tn'
let g:floaterm_keymap_next   = '<leader>tp'
let g:floaterm_keymap_toggle = 'tt'
let g:floaterm_title         = '$1/$2'

" Как пользоваться:
" выделять текущее слово: <leader>m;
" отменить выделение текущего слова: <leader>m;
" отменить все выделения: mm
nnoremap mm :MarkClear<CR>

" For 'dyng/ctrlsf.vim'
" ctrlsf is the ultimate global search tool.
" Usage:
" (1) search current word: <leader>f;
" (2) switch display style: M(in result window);
" (3) preview current result: Ctrl-p(in result window)
" (4) custom search: ff;
" (5) toggle search reslt: cc
let g:ctrlsf_search_mode = 'async'
let g:ctrlsf_preview_position = 'outside'
let g:ctrlsf_populate_qflist = 1
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_winsize = '50%'
let g:ctrlsf_compact_winsize = '30%'
let g:ctrlsf_auto_close = {
    \ "normal" : 0,
    \ "compact": 0
    \}
let g:ctrlsf_auto_focus = { "at": "start" }
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_backend = 'rg'
let g:ctrlsf_mapping = { "popen": "<C-P>" }

nnoremap cc :CtrlSFToggle<CR>
nmap ff <Plug>CtrlSFPrompt
nmap <leader>f <Plug>CtrlSFCwordPath<CR>


"ALE
let g:ale_linters = {
            \   'cpp': ['cc', 'clang', 'cppcheck', 'clang++'],
            \   'python': ['pylint'],
            \   'go': ['golangci-lint'],
            \}
let g:ale_python_pylint_options = "--load-plugins pylint_django --django-settings-module=core.settings.dev" 
";--init-hook='import sys; sys.path.append(\".\")'"
let g:ale_python_auto_virtualenv = 1
let g:ale_fixers = {
            \   'cpp': ['clang-format'],
            \   'python': ['black'],
            \   'go': ['goimports', 'gofmt'],
            \}
let g:ale_linters_ignore = {'cpp': ['clangcheck', 'clangtidy']}
let g:ale_cpp_cc_options = "-std=c++17 -Wall"
let g:ale_cpp_clangd_options = "-std=c++17 -Wall"
" Опции для golangci-lint
let g:ale_go_golangci_lint_options = '--enable-all --fast'
" Не подсвечивать ошибки
let g:ale_set_highlights = 0
" Не линтить при изменении текста
let g:ale_lint_on_text_changed = 'never'
" Не линтить при входе в файл
let g:ale_lint_on_enter = 0
" Колонка с индикаторами ошибок/предупреждений
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" For cpp highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1


" For vim-gutentags
" The gutentags is used to auto generate tag, it is still usefull for most,
" as it is quite fast, although the match result maybe wrong at sometimes.
" Usage:
" (1) go to definition of current word: Ctrl-];
" (2) go back: Ctrl-t

" Project root flag, stop to find in the parent dir
let g:gutentags_enabled = 1
let g:gutentags_trace = 0
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project', 'package.json']
" Tag file name
let g:gutentags_ctags_tagfile = 'tags'
" Put the tags into ~/.cache/tags
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" Tags parameter
let g:gutentags_ctags_extra_args = ['-R', '--fields=+niazS', '--extras=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" let g:gutentags_ctags_extra_args += ['--language-force=C++']
" Create the dir if needed
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

let g:gutentags_add_default_project_roots = 0
let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git', 'cmake']
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0

" Maybe also exclude 'build'
let g:gutentags_ctags_exclude = [
\  '*.git', '*.svn', '*.hg',
\  'cache', 'dist', 'bin', 'node_modules', 'bower_components',
\  '*-lock.json',  '*.lock',
\  '*.min.*',
\  'CMakeLists.txt',
\  '*.bak',
\  '*.zip',
\  '*.pyc',
\  '*.class',
\  '*.sln',
\  '*.csproj', '*.csproj.user',
\  '*.tmp',
\  '*.cache',
\  '*.vscode',
\  '*.pdb',
\  '*.pb',
\  '*.exe', '*.dll', '*.bin',
\  '*.mp3', '*.ogg', '*.flac',
\  '*.swp', '*.swo',
\  '.DS_Store', '*.plist',
\  '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png', '*.svg',
\  '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
\  '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx', '*.xls',
\]

" Add "'detach': 1," to the build_default_job_options in autoload/gutentags.vim
" ref to:
" https://github.com/ludovicchabant/vim-gutentags/issues/178
" https://github.com/ludovicchabant/vim-gutentags/issues/167
" https://github.com/ludovicchabant/vim-gutentags/issues/168


" For tagbar
" Usage:
" (1) toggle tagbar: tb;
" (2) preview current tag: p(in tagbar window);
" (3) toggle maximize tagbar window: x(in tagbar window)
let g:tagbar_compact = 1 " remove the first line help info
let g:tagbar_width = 30
let g:tagbar_autoshowtag = 1 " auto highlight tags when edit file
let g:tagbar_iconchars = ['▸', '▾']

nnoremap tb :TagbarToggle<CR>

"for vim-indent-guides
let g:indentLine_setColors = 1
let g:indentLine_color_term = 239


