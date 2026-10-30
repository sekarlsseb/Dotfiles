let mapleader = " "
 
inoremap jj <Esc>
nnoremap <leader>e :Ex<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Move selected lines up/down in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Paste without losing register
xnoremap <Leader>p "_dP

" Copy to system clipboard
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y

" Select all
nnoremap <C-a> ggVG

" Keep cursor centered when scrolling
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

:set number
:set relativenumber

" Make Alt work in terminal Vim (the terminal sends Alt+j as Esc then j)
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
set ttimeout ttimeoutlen=50

" Move lines with Alt+j / Alt+k
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv
