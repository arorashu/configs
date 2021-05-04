:set nu
:set background=dark
:set tabstop=2
:set shiftwidth=2
:set expandtab
:set autoindent
:set ignorecase


" for vim and tmux to play nicely
" https://ericdevries.dev/post/vim-ctrl-arrow-deletes-lines/
if &term =~ '^screen'
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" to allow vim scroll in tmux
" http://vimdoc.sourceforge.net/htmldoc/options.html#'mouse'
set mouse=a

