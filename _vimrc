set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
"set rtp+=~/.vim/bundle/
call vundle#rc()

" ==========================================================
" Bundles (use vundle)
" ==========================================================
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'
" Bundle 'Lokaltog/powerline' 
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'tell-k/vim-autopep8'
Bundle 'sjl/badwolf' 

" file finder
Bundle 'kien/ctrlp.vim'
Bundle 'benmills/vimux'

" The rest of your config follows here
" augroup vimrc_autocmds
"     autocmd!
"     " highlight characters past column 120
"     autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
"     autocmd FileType python match Excess /\%120v.*/
"     autocmd FileType python set nowrap
"     augroup END

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

" cursor
set fileformat=unix
" set cursorline
set ruler
" set cursorcolumn
" set completeopt-=preview
" hi cursorline ctermbg=lightblue
" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white 
" hi cursorcolumn ctermbg=lightblue

set encoding=utf-8
set fileencodings=utf-8,chinese,gbk,latin-1

set hid "chang buffer without saving

" colorscheme desert
colorscheme badwolf
" set guifont=Monaco:h13
set wrap
set pastetoggle=<F3>
set autoindent
set smartindent             " use smart indent if there is no indent file

" I'm prefer spaces to tabs
set tabstop=4
set shiftwidth=4
set expandtab
set matchpairs+=<:>         " show matching <> (html mainly) as well
set showmatch               " Briefly jump to a paren once it's balanced
set virtualedit=block       " Let cursor move past the last char in <C-v> mode

" ==========================================================
" Shortcuts
" ==========================================================
let mapleader=","             " change the leader to be a comma vs slash
map <F2> :NERDTreeToggle<CR>
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
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_options_max_line_length = 80
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


" more subtle popup colors 
if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold    
endif

let mapleader=","             " change the leader to be a comma vs slash

" autopep8 
nmap <leader>f :Autopep8<CR>
let g:autopep8_ignore="W293,E501"
" let g:autopep8_pep8_passes=100
let g:autopep8_max_line_length=79
let g:autopep8_aggressive=1        " Enable possibly unsafe changes (E711, E712)
let g:autopep8_disable_show_diff=1 " Disable show diff window


let g:jedi#popup_on_dot = 1
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

let NERDTreeIgnore = ['\.pyc$']

""""""""""""""""""""""""""""""""""""""""""""
" => ctrlp line
""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

hi CursorLine cterm=NONE ctermbg=brown ctermfg=white guibg=NONE guifg=NONE

