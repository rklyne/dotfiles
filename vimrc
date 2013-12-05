
" execute pathogen#infect()

filetype plugin indent on

syntax on

" Relative line numbers
try
    set rnu 
catch
    set number
endtry


" Indentation
set autoindent
set tabstop=4
set shiftwidth=4
" Only with spaces
set expandtab

" Wrapping
" Break at words
set linebreak

" Autocorrect my common typographical fuck-upws
"                                            ^ loltypo :-)
iabbrev improt import


