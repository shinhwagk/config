set ts=2
set expandtab # convet tab to space

call plug#begin('~/.vim/plugged')                                             
Plug 'voldikss/vim-floaterm'                                                 
call plug#end()                
                       
                                                                                                               
let g:floaterm_height = 0.8                                                     
let g:floaterm_width = 0.8                                                      
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'
hi FloatermBorder guibg=orange guifg=cyan
