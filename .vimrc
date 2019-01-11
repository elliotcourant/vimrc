set nocompatible
filetype off

" Fuzzy file finder
set rtp+=/usr/local/opt/fzf


" Vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'w0rp/ale'

call vundle#end()



" Vim-Plug
filetype plugin indent on

call plug#begin('~/.vim/plugged')

" LANGUAGES
" -Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


" MISC
Plug 'vim-scripts/Tabmerge'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'


" AUTOCOMPLETE

" THEMES
" -Editor Theme
Plug 'drewtempelmeyer/palenight.vim'


" Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'StanAngeloff/php.vim'
" Plug 'sheerun/vim-polyglot'
" Plug 'posva/vim-vue'
" Plug 'ervandew/supertab'
" Plug 'mileszs/ack.vim'
" Plug 'qpkorr/vim-bufkill'
" Plug 'tpope/vim-fugitive'
" Plug 'shumphrey/fugitive-gitlab.vim'
" Plug 'godlygeek/tabular'
" Plug 'arnaud-lb/vim-php-namespace'
" Plug 'tpope/vim-abolish'

call plug#end()

let mapleader = "'"

set number

set expandtab ts=4 sw=4 ai

set bs=2

set laststatus=2

inoremap jjtr \DebugLogger::trace();<Left><Left>
inoremap jjma \DebugLogger::mark();<Left><Left>
inoremap jjlo \DebugLogger::log("");<Left><Left><Left>
inoremap jjdu \DebugLogger::log(<esc>p$a);
inoremap jjsh \DebugLogger::shallow(<esc>p$a);

" autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | endif

set showcmd
let NERDTreeShowHidden=1
let NERDTreeMapOpenInTab='<enter>'

set background=dark
colorscheme palenight

set nowrap
set go+=b.

set statusline=
" set statusline+=%#PmenuSel#
" set statusline+=%{StatuslineGit()}
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=\ %n\           " buffer number
set statusline+=%#Visual#       " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#     " colour
set statusline+=%R                        " readonly flag
set statusline+=%M                        " modified [+] flag
set statusline+=%#Cursor#               " colour
set statusline+=%#CursorLine#     " colour
set statusline+=\ %t\                   " short file name
set statusline+=%=                          " right align
set statusline+=%#CursorLine#   " colour
set statusline+=\ %Y\                   " file type
set statusline+=%#CursorIM#     " colour
set statusline+=\ %3l:%-2c\         " line + column
set statusline+=%#Cursor#       " colour
set statusline+=\ %3p%%\                " percentage

set mouse=a

nmap <Leader>n :NERDTreeToggle<CR>


"FZF
nmap <Leader>t :Tags<CR>
nmap <Leader>f :Files<CR>
noremap <c-]> :call fzf#vim#tags(expand('<cword>'), {'options': '--exact --select-1 --exit-0'})<CR>


set rtp+=/usr/local/opt/fzf
set rtp+=/.fzf
let g:fzf_tags_command = 'ctags -R --fields=+laimS --languages=php'

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap ; :Buffers<CR>

" ALE Syntax Hilighting
let g:ale_lint_on_text_changed = 1
let g:ale_sign_column_always = 1



let g:ale_linters = {
\    'javascript': ['eslint']
\}

let g:ale_php_phpcs_standard = 'PSR12'
let g:ale_php_phpmd_ruleset = 'codesize,design,unusedcode,naming'
let g:ale_fixers = {
\   '*': [],
\   'javascript': ['remove_trailing_lines', 'trim_whitespace'],
\   'php': ['remove_trailing_lines', 'trim_whitespace', 'php_cs_fixer'],
\}

let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']


let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
