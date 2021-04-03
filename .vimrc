" -----------------------------------------------------
" Plugins
"
call plug#begin(expand('~/.vim/plugged'))

Plug 'arcticicestudio/nord-vim'
"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-gitgutter'
Plug '~/.fzf'

call plug#end()

" -----------------------------------------------------
" Nord configuration
"
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_status_lines = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_uniform_diff_background = 1
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

" List of available color schemes:
" - blue
" - darkblue
" - default
" - delek
" - desert
" - elflord
" - evening
" - industry
" - koehler
" - morning
" - murphy
" - pablo
" - peachpuff
" - ron
" - shine
" - slate
" - torte
" - zellner
colorscheme nord

" -----------------------------------------------------
" Lightline configuration
"
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

" -----------------------------------------------------
" Airline configuration
"
let g:airline_theme='nord'
let g:airline_powerline_fonts = 1

" -----------------------------------------------------
" Indent guides configuration
"
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

" -----------------------------------------------------
" Gitgutter configuration
"
set updatetime=100
let g:gitgutter_terminal_reports_focus = 0
"let g:gitgutter_grep = ''
let g:gitgutter_enabled = 0
let g:gitgutter_signs = 1
let g:gitgutter_highlight_lines = 1
let g:gitgutter_highlight_linenrs = 1
let g:gitgutter_log = 0
"set signcolumn=yes

" -----------------------------------------------------
" FZF configuration
"
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

" -----------------------------------------------------
" More options
"
set encoding=utf-8 " needed for Airline and emojis

" Fix italics escape codes
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Highlight active cursor line
set cursorline

" Syntax highlighting
syntax enable

" Show line numbers
set number

" Do not show redundant mode info in status line when using Airline or Lightline plugin
set noshowmode

" Always display the status line, even if only one window is displayed
set laststatus=2

" Show full file path in status line
set statusline+=%F "does not work yet...

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell is unset, this does nothing.
"set t_vb=

" Highlight searches
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled,
" keep the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Show invisible characters (except whitespaces)
" Toggle with :set list!
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" -----------------------------------------------------
" Key mappings
"
" Toggle paste mode (normal and insert mode)
set pastetoggle=<F2>

"
" Normal mode mappings
"
" Toggle line numbers
noremap <silent> <F1> :set number!<CR>

" Toggle invisible characters
noremap <silent> <F3> :set list!<CR>

" Toggle GitGutter
noremap <silent> <F4> :GitGutterToggle<CR>

" Jump to beginning, first non-whitespace character, or end of line
nnoremap <C-a><C-a> <ESC>0
nnoremap <C-a> <ESC>^
nnoremap <C-e> <ESC>$

" This mapping grabs the X11 primary clipboard register and opens the corresponding netcdf header in a new vertical split
"nnoremap <leader>ncd :vnew<Bar>0r!ncdump -h <C-R>*<CR>

"
" Insert mode mappings
"
" Toggle line numbers
inoremap <silent> <F1> <C-O>:set number!<CR>

" Toggle invisible characters
inoremap <silent> <F3> <C-O>:set list!<CR>

" Toggle GitGutter
inoremap <silent> <F4> <C-O>:GitGutterToggle<CR>

" Jump to beginning, first non-whitespace character, or end of line
inoremap <C-a><C-a> <C-o>0
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$

