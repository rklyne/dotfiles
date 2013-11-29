
" execute pathogen#infect()
" syntax on
" filetype plugin indent on


" Relative line numbers
if version >= 730 
    :set rnu 
else
    :set number
endif


" Indentation
:set autoindent
:set tabstop=4
:set shiftwidth=4
" Only with spaces
:set expandtab

" Wrapping
" Break at words
:set linebreak

" Autocorrect my common typographical fuck-upws
"                                            ^ loltypo :-)
:iabbrev improt import


