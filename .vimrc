" -----------------------------------------------------
" Plugins
"
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(expand('~/.vim/plugged'))

" Nord Vim color scheme
Plug 'arcticicestudio/nord-vim'

" Lighline status line
Plug 'itchyny/lightline.vim'

" Initialize plugin system
call plug#end()

" -----------------------------------------------------
" Nord Vim configuration
"
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
colorscheme elflord

" -----------------------------------------------------
" Lightline configuration
"
" Do not show redundant mode info in status line
set noshowmode

" -----------------------------------------------------
" More options
"
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
