set tabstop=2 shiftwidth=2 expandtab
set nowrap

"Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

"Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
map <C-H> :tabp<CR>
map <C-L> :tabn<CR>

" Move to the next buffer
" nmap <leader>l :bnext<CR>

" Move to the previous buffer
" nmap <leader>h :bprevious<CR>

map <leader>. :Bclose<cr>
map <leader>/ :tabclose<cr>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
" nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
" nmap <leader>bl :ls<CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>kkuu

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

nnoremap \ :Ag<SPACE>

"Use TAB to complete when typing words, else inserts TABs as usual.
""Uses dictionary and source files to find matching words to complete.

"See help completion for source,
""Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
""Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
" function! Tab_Or_Complete()
"   if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"       return "\<C-N>"
"   else
"       return "\<Tab>"
"   endif
" endfunction
" :inoremap <Tab-Tab> <C-R>=Tab_Or_Complete()<CR>
" :set dictionary="/usr/dict/words"

set number

let g:session_autoload = 'no'
let g:session_autosave = 'yes'

let g:multi_cursor_next_key="\<C-m>"
