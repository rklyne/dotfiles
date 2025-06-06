
" Core. Not sure how to best describe it.
set nocompatible

" netrw
set wildignore+=*.sw[a-z],*.pyc

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

packadd lsp
packadd poet-v

""""""""""""""""""""""
" Fix distro defaults
augroup redhat
    autocmd!
augroup END

""""""""""""""""""""""
" Appearance

set t_Co=16
syntax enable
let g:solarized_termtrans = 1
set listchars=eol:↩,tab:▶▹,nbsp:␣,extends:…,trail:•
" I never use this and always hit it by mistake
" :call togglebg#map("b") " <m-b>

" projector happy colours
" colorscheme koehler
colorscheme solarized
set background=dark

filetype plugin indent on

syntax on

colorscheme solarized
" set background=dark
set background=light

" Rainbow parens
" au Syntax * RainbowParenthesesActivate
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces
" nnoremap <F10> :RainbowParenthesesToggle<Enter>
" inoremap <F10> <C-O>:RainbowParenthesesToggle<Enter>
let g:rainbow_active = 1

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" Syntastic config
set laststatus=2
set statusline+=%F
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_checkers = ['flake8', 'pyflakes',]
let g:syntastic_python_flake8_args = "--max-line-length=120"
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_open = 1

" TypeScript syntastic config
" let g:tsuquyomi_disable_quickfix = 1
" let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.

let g:ycm_key_invoke_completion = '<C-.>'

if !exists("g:ycm_semantic_triggers")
   let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
set completeopt-=preview

"""""""""""""""""""""""""""""""""
" LSP support for completion.

" if executable('pylsp')
"     " pip install python-lsp-server
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'pylsp',
"         \ 'cmd': {server_info->['pylsp']},
"         \ 'allowlist': ['python'],
"         \ })
" endif
" 
" function! s:on_lsp_buffer_enabled() abort
"     setlocal omnifunc=lsp#complete
"     setlocal signcolumn=yes
"     if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
"     nmap <buffer> gd <plug>(lsp-definition)
"     nmap <buffer> gs <plug>(lsp-document-symbol-search)
"     nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
"     nmap <buffer> gr <plug>(lsp-references)
"     nmap <buffer> gi <plug>(lsp-implementation)
"     nmap <buffer> gt <plug>(lsp-type-definition)
"     nmap <buffer> <leader>rn <plug>(lsp-rename)
"     nmap <buffer> <leader>q <plug>(lsp-code-action)
"     nmap <buffer> [g <plug>(lsp-previous-diagnostic)
"     nmap <buffer> ]g <plug>(lsp-next-diagnostic)
"     nmap <buffer> [r <plug>(lsp-previous-reference)
"     nmap <buffer> ]r <plug>(lsp-next-reference)
"     nmap <buffer> K <plug>(lsp-hover)
"     nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
"     nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
" 
"     let g:lsp_format_sync_timeout = 1000
"     autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
"     
"     " refer to doc to add more commands
" endfunction
" 
" augroup lsp_install
"     au!
"     " call s:on_lsp_buffer_enabled only for languages that has the server registered.
"     autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
" augroup END

" Newer LSP:
" https://github.com/yegappan/lsp
"
" Servers on wiki: https://github.com/yegappan/lsp/wiki


" Bash
call LspAddServer([#{name: 'bashls', 
                 \   filetype: 'sh',
                 \   path: '/snap/bin/bash-language-server',
                 \   args: ['start']
                 \ }])

call LspAddServer([#{name: 'pylsp',
                 \   filetype: 'python',
                 \   path: '/usr/bin/pylsp',
                 \   args: []
                 \ }])

" call LspAddServer([#{name: 'pyright',
"                  \   filetype: 'python',
"                  \   path: '/usr/local/bin/pyright-langserver',
"                  \   args: ['--stdio'],
"                  \   workspaceConfig: #{
"                  \     python: #{
"                  \       pythonPath: '/usr/bin/python3.11'
"                  \   }}
"                  \ }])

call LspAddServer([#{name: 'rustanalyzer',
                 \   filetype: ['rust'],
                 \   path: '/home/rk/.cargo/bin/rust-analyzer',
                 \   args: [],
                 \   syncInit: v:true
                 \ }])

" call LspAddServer([#{name: 'tsserver',
"                  \   filetype: ['javascript', 'typescript'],
"                  \   path: '/home/rk/.nvm/versions/node/v16.20.2/bin/typescript-language-server',
"                  \   args: ['stdio']
"                  \ }])


" Javascript/Typescript language server
" 	\    path: '/usr/local/bin/typescript-language-server',
call LspAddServer([#{
	\    name: 'typescriptlang',
	\    filetype: ['javascript', 'typescript'],
	\    path: '/home/rk/.nvm/versions/node/v16.20.2/bin/typescript-language-server',
	\    args: ['--stdio'],
	\  }])

nmap K :LspHover<enter>
nmap gr :LspPeekReferences<enter>
nmap gD :LspGotoDeclaration<enter>
nmap gd :LspGotoDefinition<enter>
nmap gi :LspGotoImpl<enter>
nmap gt :LspGotoTypeDef<enter>
nmap <leader>t :LspPeekTypeDef<enter>
nmap <leader>p :LspFormat<enter>
nmap <leader>rn :LspRename<enter>
nmap <leader>q :LspCodeAction<enter>

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
endtry
set number

" Indicate the cursor row
highlight CursorLineNr term=bold ctermfg=7 gui=bold guifg=Yellow ctermbg=3
if v:version < 704
    " If the above didn't work, cursorline
    set cursorline
endif
" Scroll when 2 lines from screen edge
set scrolloff=2

""""""""""""""""""""""""""""""""""
" Formatting

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

au BufRead,BufNewFile *.ts  setlocal filetype=typescript

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

" TS/JS indentation
autocmd FileType javascript,typescript set sw=2 ts=2 sts=2
autocmd BufEnter *.tsx set filetype=typescript
autocmd BufEnter *.ts set filetype=typescript
" autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

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
hi def InterestingWord1 guifg=#000000 ctermfg=2 guibg=#ffa724 ctermbg=7 cterm=bold
hi def InterestingWord2 guifg=#000000 ctermfg=7 guibg=#aeee00 ctermbg=2
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

" Faster updates for gitgutter
set updatetime=100

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
iabbrev fmor from
iabbrev fomr from
iabbrev stirng string
iabbrev undeifned undefined

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
nnoremap r :redraw!<Enter>

" Powerline
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

" Write a readonly file:
cmap w!! w !sudo tee % >/dev/null


"""""""""""""""""""""""
" Completion for Python

autocmd FileType python setlocal completeopt-=preview
" let g:jedi#completions_command = "<C-/>"

"""""""""""""""""""""
" completion for other stuff
let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = ['coc-tsserver']

"""""""""""""""""
" Node JS
autocmd FileType javascript setlocal sw=2

""""""""""""""""""""""
" Tags
let g:gutentags_ctags_exclude = ['*/deploy/*', '*/node_modules/*', 'scratch', '*/branches/*', '*/.tox/*', '*/releases/*']


