
" Core. Not sure how to best describe it.
set nocompatible

" netrw
let g:netrw_list_hide= '\(.*\.swp$\)\|\(.*\.pyc$\)'

" Some detections to prevent errors/warnings on shared boxes
let g:pathogen_disabled = []
if !executable('ctags')
    let g:pathogen_disabled += ['taglist.vim',]
endif

" Load pathogen if it's there (provides my fsharp syntax at least)
try
" Pathogen
    filetype off " Pathogen needs to run before plugin indent on
    call pathogen#infect()
    call pathogen#helptags() " generate helptags for everything in 'runtimepath'
    filetype plugin indent on
catch
endtry

""""""""""""""""""""""
" Fix distro defaults
augroup redhat
    autocmd!
augroup END

""""""""""""""""""""""
" Appearance

syntax enable
set background=dark
let g:solarized_termtrans = 1

" projector happy colours
" colorscheme koehler
colorscheme solarized
set background=dark

filetype plugin indent on

syntax on

colorscheme solarized
set background=dark

" Rainbow parens
au Syntax * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
nnoremap <F10> :RainbowParenthesesToggle<Enter>
inoremap <F10> <C-O>:RainbowParenthesesToggle<Enter>

"""""""""""""""""""""""""""""""""
" Little informational bits
" Status line
set ruler
" show me partially typed commands
set showcmd
set cursorline

" Relative line numbers
try
    set rnu 
catch
    set number
endtry

" Indicate the cursor row
highlight CursorLineNr term=bold ctermfg=7 gui=bold guifg=Yellow ctermbg=3
if v:version < 704
    " If the above didn't work, cursorline
    set cursorline
endif
" Scroll when 2 lines from screen edge
set scrolloff=2

"""""""""""""""""""""""""""""""""""
" Writing text

" Backspace to work 'normally'
set bs=indent,eol,start

" Indentation
set autoindent
set tabstop=4
set sts=4
set shiftwidth=4
" Only with spaces
set expandtab

" Wrapping
" Break at words
set linebreak

" Folding - off by default
set foldlevel=99
autocmd BufEnter *.md set foldlevel=99

"""""""""""""""""""
" Hightlights

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Highlight Word
"
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily. You can search for it, but that only
" gives you one color of highlighting. Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.

function! HiInterestingWord(n)
    " Save our location.
    normal! mz
    " Yank the current word into the z register.
    normal! "zyiw
    " Calculate an arbitrary match ID. Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction

" Default Highlights
hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

"""""""""""""""""""
" Searching

" searching in files made easier
set ignorecase
set smartcase

" TagList
nnoremap <F4> :Tlist<Enter>
inoremap <F4> <C-o>:Tlist<Enter>

" python-mode pep8 off.
" au VimEnter * PymodeLintToggle

" vim-sexp - disable 'specials' on closing bracket in insert mode
let g:sexp_enable_insert_mode_mappings = 0


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
nnoremap <F5> :source ~/.vimrc <Enter>
nnoremap <F3> :!grep -r -A2 -B2 "<C-R><C-W>" *<Enter>
nnoremap <S-F3> :!grep -A2 -B2 "<C-R><C-W>" *<Enter>

" netrw
let g:netrw_list_hide= '\(.*\.swp$\)\|\(.*\.pyc$\)'

" Powerline
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup


