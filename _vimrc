" enable filetype scripts
filetype plugin on

" I want coloured code
syntax on
" ...but I use a black terminal
set background=dark

" my template files
au BufNewFile *.pl 0r ~/.vim/templates/perl.tmpl

" ikiwiki editing
au BufNewFile,BufRead *.mdwn set ft=ikiwiki
au BufNewFile,BufRead *.mdwn set tw=90

" preserve current indent on new lines
set autoindent
" make backspaces delete sensibly
set backspace=indent,eol,start
" indentation levels every four columns
set tabstop=4
" convert all tabs to space
set expandtab
" indent/outdent by four columns
set shiftwidth=4
" indent/outdent to nearest tabstops
set shiftround

" no backup-files like bla~ 
set nobackup
set nowritebackup 

" a nice looking font for gvim
set guifont=DejaVu\ Sans\ Mono\ 9

" hack for pretty manpages
autocmd FileType man setlocal ro nonumber nolist fdm=indent fdn=2 sw=4 foldlevel=2 | nmap q :quit

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" enable modelines for non-root
if $USER != 'root'
    set modeline
else
    set nomodeline
endif
