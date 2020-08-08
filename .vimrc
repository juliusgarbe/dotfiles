" -----------------------------------------------------
" Plugins
"

call plug#begin(expand('~/.vim/plugged'))

Plug 'arcticicestudio/nord-vim'
"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" -----------------------------------------------------
" Nord configuration
"

let g:nord_cursor_line_number_background = 1
let g:nord_uniform_status_lines = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_uniform_diff_background = 1
let g:nord_bold = 1
"let g:nord_italic = 1
"let g:nord_italic_comments = 1

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
" More options
"
" Highlight active cursor line
set cursorline

" Syntax highlighting
syntax enable

" Show line numbers
set number

" Do not show redundant mode info in status line when using Airline or
" Lightline plugin
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

" -----------------------------------------------------
" Key mappings
"
" Normal mode mappings

" This mapping grabs the clipboard register and opens the corresponding netcdf header in a new vim vertical split
"nnoremap <leader>nc :vnew<Bar>0r!ncdump -c <C-R>+<CR>
