set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" ==========================================================
" Bundles (use vundle)
" ==========================================================
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'
Bundle 'Lokaltog/powerline'

" The rest of your config follows here
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    augroup END

" Powerline setup
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""
" => Backup
""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile
set noar

" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.

" don't bell or blink
set noerrorbells
set vb t_vb=

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

" ==========================================================
" Shortcuts
" ==========================================================
let mapleader=","             " change the leader to be a comma vs slash
map <F2> :NERDTreeToggle<CR>
set pastetoggle=<F3>
au BufNewFile,BufRead *.py map <buffer> <leader><space> :w!<cr>:!python %<cr>

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

""""""""""""""""""""""""""""""""""""""""""""
" => Python-mode
""""""""""""""""""""""""""""""""""""""""""""
" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)

let g:pymode = 1
let g:pymode_warning =1
" let g:pymode_paths = []
" 1et g:pymode_rope = 0
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_options_max_line_length = 79
let g:pymode_indent = 1
let g:pymode_motion = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'

"Linting
let g:pymode_lint = 1
" Auto check on save
let g:pymode_lint_on_write = 1
let g:pymode_lint_unmodified = 0
let g:pymode_lint_on_fly = 0
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
" let g:pymode_lint_ignore = "E501,W"
" let g:pymode_lint_select = "E501,W0011,W430"
" let g:pymode_lint_sort = ['E', 'C', 'I']
let g:pymode_lint_cwindow = 1
let g:pymode_lint_signs = 1
let g:pymode_lint_todo_symbol = 'WW'
let g:pymode_lint_comment_symbol = 'CC'
let g:pymode_lint_visual_symbol = 'RR'
let g:pymode_lint_error_symbol = 'EE'
let g:pymode_lint_info_symbol = 'II'
let g:pymode_lint_pyflakes_symbol = 'FF'

" Support virtualenv
let g:pymode_virtualenv = 1
" let g:pymode_virtualenv_path = $VIRTUAL_ENV

let g:pymode_run = 1
let g:pymode_run_bind = '<leader>r'

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_syntax_print_as_function = 0
let g:pymode_syntax_highlight_stars_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_equal_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_self = g:pymode_syntax_all
let g:pymode_syntax_builtin_objs = g:pymode_syntax_all
let g:pymode_syntax_builtin_types = g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all
let g:pymode_syntax_docstrings = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>
autocmd BufNewFile, *.py 0r ~/.vim/template/python.tpl

" automatically change window's cwd to file's dir
set autochdir

" I'm prefer spaces to tabs
set tabstop=4
set shiftwidth=4
set expandtab

" more subtle popup colors 
if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold    
endif

let mapleader=","             " change the leader to be a comma vs slash
