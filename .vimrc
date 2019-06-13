" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(expand('~/.vim/plugged'))

" Make sure you use single quotes

" Nord Vim color scheme
Plug 'arcticicestudio/nord-vim'

" Initialize plugin system
call plug#end()


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
