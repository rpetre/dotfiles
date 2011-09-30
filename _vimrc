" enable filetype scripts
filetype plugin on

" I want coloured code
syntax on
" ...but I use a black terminal
set background=dark

" my template files
au BufNewFile *.pl 0r ~/.vim/templates/perl.tmpl

" cfengine configs
au BufNewFile,BufRead /*var/cfengine/*/inputs/* set filetype=cfengine

" ssh_config stubs
au BufNewFile,BufRead */.ssh/*.conf setf sshconfig

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
" make the backspace key feel 'right' about tabs
set softtabstop=4
" indent/outdent by four columns
set shiftwidth=4
" indent/outdent to nearest tabstops
set shiftround
" better tab-completion behaviour
set wildmode=longest,list:longest,list:full

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

set exrc " for vroom

" netrw stuff
"let g:netrw_browse_split=2
let g:netrw_altv=1
