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
let g:airline#extensions#tabline#enabled = 1

" fix broken airline_section_x
let g:airline_section_x=''

" fix powerline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' :'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'

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
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let g:fzf_layout = { 'down': '50%' }

" -----------------------------------------------------
" Netrw configuration
"
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
let g:netrw_browse_split = 4
let g:netrw_preview = 1
let g:netrw_list_hide= '.*\.swp$'
"let g:netrw_altv = 1
let g:netrw_chgwin = 2

function ToggleNetRW()
    if exists("g:netrw_buffer") && bufexists(g:netrw_buffer)
        exe "bd".g:netrw_buffer | unlet g:netrw_buffer
    else
        Vexplore | let g:netrw_buffer=bufnr("%")
    endif
endfunction

" Netrw key mappings
function! NetrwMapping()
  nmap <buffer> <left> -
  nmap <buffer> . gh
  nmap <buffer> q <C-w>z
endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

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
" Open FZF
nnoremap <Tab><Tab> :FZF<CR>

" Open Netrw directory browser
"nnoremap <silent> <F1> :Vexplore<CR>
nnoremap <silent> e :call ToggleNetRW()<CR>

" Toggle line numbers
nnoremap <silent> <F1> :set number!<CR>

" Toggle GitGutter
nnoremap <silent> <F3> :GitGutterToggle<CR>

" Toggle invisible characters
nnoremap <silent> <F4> :set list!<CR>

" Toggle spell checking
nnoremap <silent> <F5> :set spell!<CR>

" Jump to beginning, first non-whitespace character, or end of line
nnoremap <C-a><C-a> <ESC>0
nnoremap <C-a> <ESC>^
nnoremap <C-e> <ESC>$

" Change between split panes
nnoremap <silent> <S-Right> <C-w><Right>
nnoremap <silent> <S-Left> <C-w><Left>
nnoremap <silent> <S-Up> <C-w><Up>
nnoremap <silent> <S-Down> <C-w><Down>

" Change between buffers
nnoremap <silent>  :bn<CR>
nnoremap <silent>  :bp<CR>

" Change between tabs
nnoremap <silent> <Tab> gt
nnoremap <silent> <S-Tab> gT

" This mapping grabs the X11 primary clipboard register and opens the corresponding netcdf header in a new vertical split
"nnoremap <leader>ncd :vnew<Bar>0r!ncdump -h <C-R>*<CR>

"
" Insert mode mappings
"
" Toggle line numbers
inoremap <silent> <F1> <C-O>:set number!<CR>

" Toggle GitGutter
inoremap <silent> <F3> <C-O>:GitGutterToggle<CR>

" Toggle invisible characters
inoremap <silent> <F4> <C-O>:set list!<CR>

" Toggle spell checking
inoremap <silent> <F5> <C-O>:set spell!<CR>

" Jump to beginning, first non-whitespace character, or end of line
inoremap <C-a><C-a> <C-o>0
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$

