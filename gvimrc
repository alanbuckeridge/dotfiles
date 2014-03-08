" Open gVim in maximised window
if has('win32')
	au GUIEnter * simalt ~x
else
	" Hacky
	set lines=999 columns=999
endif

set guioptions-=T	" Remove toolbar

" resize current buffer by +/- 5
nnoremap <M-Right> :vertical resize +5<CR>
nnoremap <M-Left>  :vertical resize -5<CR>
nnoremap <M-Up>    :resize -5<CR>
nnoremap <M-Down>  :resize +5<CR>

" Command+Option+Right for next
" map <D-M-Right> :tabn<CR>
" Command+Option+Left for previous
" map <D-M-Left> :tabp<CR>

" Automatically resize splits
" when resizing MacVim window
autocmd VimResized * wincmd =

