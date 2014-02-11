
" Load pathogen if it's there (provides my fsharp syntax at least)
try
" Pathogen
    filetype off " Pathogen needs to run before plugin indent on
    call pathogen#infect()
    call pathogen#helptags() " generate helptags for everything in 'runtimepath'
    filetype plugin indent on
catch
endtry

filetype plugin indent on

syntax on

" searching in files made easier
set ignorecase
set smartcase

" Rainbow parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" python-mode pep8 off.
" au VimEnter * PymodeLintToggle

" vim-sexp - disable 'specials' on closing bracket in insert mode
let g:sexp_enable_insert_mode_mappings = 0



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

" Folding - off by default
set foldlevel=99
autocmd BufEnter *.md set foldlevel=99

" Autocorrect my common typographical fuck-upws
"                                            ^ loltypo :-)
iabbrev improt import

" Cross-vims copy/paste
" copy to buffer
vmap <C-c> :w! ~/.vimbuffer<CR>
nmap <C-c> :.w! ~/.vimbuffer<CR>
" paste from buffer
map <C-p> :r ~/.vimbuffer<CR>

nnoremap <Space> :

