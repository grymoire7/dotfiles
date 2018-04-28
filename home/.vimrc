" .vimrc
" Author: Tracy Atteberry <tracy@magicbydesign.com>

" Specify plugins here using [vim-plug](https://github.com/junegunn/vim-plug).
" After changes use :PlugInstall to install.
"
"        Note that:  Plug 'benmills/vimux.git'
" is shorthand for: Plug 'https://github.com/benmills/vimux.git'
call plug#begin('~/.vim/plugged')
Plug 'benmills/vimux'
Plug 'pgr0ss/vimux-ruby-test'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mileszs/ack.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'thoughtbot/vim-rspec'
call plug#end()

" The % key will switch between opening and closing brackets. By sourcing
" matchit.vim — a standard file in Vim installations for years — the key can also
" switch among e.g. if/elsif/else/end, between opening and closing XML tags, and
" more.
runtime! macros/matchit.vim

" status line config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_splits = 0
set wildmenu
nnoremap gb :ls<CR>:b<Space>

" syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set nocompatible          " be iMproved
" set clipboard=unnamedplus " interact nicely with system clipboard (*)

" turn off search highlights by just hitting return in command mode
nnoremap <CR> :noh<CR><CR>

" needed before loading bundles so solarized works properly
" (not required with current settings)
set bg=dark

if has("autocmd")
    filetype plugin indent on   " required!
endif

if &t_Co > 2 || has("gui_running")
    set hlsearch
endif

" Colorscheme
colorscheme koehler

" set tags=./tags;

let mapleader = ","
" RSpec.vim mappings
let g:rspec_command = "!".system("git rev-parse --show-toplevel | tr -d '\\n'")."/bin/rspec {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" map ,e and ,v to open files in the same directory as the current file
cnoremap %% <C-R>=exapnd('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======
"==== exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
"==== exec "set listchars=trail:\uB7,nbsp:~"
exec "set listchars=tab:>-,trail:\uB7,nbsp:~"
set list

"====[ Make the 81st column stand out ]====================

" OR ELSE just the 81st column of wide lines...
" highlight ColorColumn ctermbg=magenta
" call matchadd('ColorColumn', '\%81v', 100)

"====[ Use ;; instead of <Esc>.  It's easier to type. ]======
imap jk <Esc>


" Section: Options {{{1
" ---------------------

set autoindent
set autowrite       " auto save before commands like :next
set backspace=indent,eol,start  " make backspace work properly
if has('win32') || has('win64')
    set backupdir=~/AppData/Local/Temp  " put backup files somewhere else
    set directory=~/AppData/Local/Temp  " directory for swap files
else
    set backupdir=/tmp,/var/tmp,~/tmp   " put backup files somewhere else
    set directory=/tmp,/var/tmp,~/tmp   " directory for swap files
endif
set cmdheight=2
set complete-=i     " don't search includes
set display=lastline

if &encoding ==# 'latin1' && has('gui_running')
    set encoding=utf-8
endif

set fileformats=unix,dos,mac

" c: auto-wrap comments
" q: rewrap comments w/gq
" r: auto insert comment leader
" l: dont break existing long lines
set formatoptions=cqrl

set ignorecase      " case insensitive search
set modeline
set modelines=5
set noerrorbells    " bells are annoying
set number          " always show line numbers
set pastetoggle=<F2>
set ruler
set showcmd
set showmatch       " jump to matching brackets
set smartcase       " smart case insensitive search
set smarttab
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{SL('CapsLockStatusline')}%y%{SL('fugitive#statusline')}%#ErrorMsg#%{SL('SyntasticStatuslineFlag')}%*%=%-14.(%l,%c%V%)\ %P
set textwidth=79    " anything bigger than this is annoying - see also: pep8
if version >= 703
    set undodir=/tmp,/var/tmp,~/tmp     " directory for undo tree files
    set undofile
endif
set wildignore+=*.pyc

"if has("mouse")
"    set mouse=a
"endif

" Tabs
set expandtab       " expand tabs into spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Plugin Settings {{{2

let g:flake8_builtins="_,apply"
let g:netrw_list_hide = '^\.,^tags$,.*\.pyc$'
let g:python_highlight_all=1    " best settings for python.vim

let g:ctrlp_user_command = {
    \ 'types': {
    \   1: ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'],
    \ },
\ }

let g:gist_detect_filetype = 1
let g:gist_show_privates = 1

let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': ['cpp']
\}

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
if has("autocmd")
    " solarized dark colors for vim-indent-guides
    let g:indent_guides_auto_colors = 0
    au VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=8 guibg=#002b36
    au VimEnter,ColorScheme * :hi IndentGuidesEven  ctermbg=0 guibg=#073642
endif

function! s:try(cmd, default)
    if exists(':' . a:cmd) && !v:count
        let tick = b:changedtick
        exe a:cmd
        if tick == b:changedtick
            execute 'normal! '.a:default
        endif
    else
        execute 'normal! '.v:count.a:default
    endif
endfunction

" }}}2

" }}}1

let g:c_syntax_for_h="true"     " c++ is dumb

" autocmds
if has("autocmd") && !exists("autocmds_loaded")
    " do this once
    let autocmds_loaded = 1

    " assume c/c++ always uses doxygen
    autocmd FileType go setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType c let b:comment = '\/\/'
    autocmd FileType c set ft=c.doxygen
    autocmd FileType cpp set ft=cpp.doxygen
    autocmd FileType h set ft=cpp.doxygen
    autocmd BufNewFile,BufRead *.dxy setf doxygen
    autocmd BufNewFile,BufRead *.sls setf yaml
    autocmd FileType yaml,json set ts=2 sts=2 sw=2
    autocmd FileType html,django,htmldjango,jinja,htmljinja set ts=2 sts=2 sw=2 tw=0 wrap lbr

    " run flake8 on writes to a Python file
    autocmd BufWritePost *.py call Flake8()

    "autocmd FileType svn-base set ft=svnbase

    " only use relative numebering in the current buffer
" if version >= 703
"     autocmd BufEnter * setlocal relativenumber number
" endif
    autocmd BufLeave * setlocal number
    " absolute numbers in insert mode
    "au InsertEnter * set number
    "au InsertLeave * set relativenumber

    " use wrap + linebreak for text based document types
    autocmd FileType latex,markdown set tw=0 wrap lbr
endif

" Section: Commands {{{1
" ----------------------

if has("eval")

    function! SL(function)
        if exists('*'.a:function)
            return call(a:function,[])
        else
            return ''
        endif
    endfunction

endif   " has("eval")

" }}}1

" Section: Mappings {{{1
" ----------------------

" fix numpad in some terminals
map <C-[>Op 0
map <C-[>Oq 1
map <C-[>Or 2
map <C-[>Os 3
map <C-[>Ot 4
map <C-[>Ou 5
map <C-[>Ov 6
map <C-[>Ow 7
map <C-[>Ox 8
map <C-[>Oy 9
map <C-[>OX =

map <F1>    <Esc>
map! <F1>   <Esc>
map <F2>    <nop>
map! <F2>    <nop>
map <F3>    :cnext<CR>
map <F4>    :cc<CR>
map <F5>    :cprev<CR>

noremap <S-Insert>  <MiddleMouse>
noremap! <S-Insert> <MiddleMouse>

" open files with path relative to current buffer
map <Leader>re :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>rt :tabnew <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>rv :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>rs :sp <C-R>=expand("%:p:h") . "/" <CR>

"=====[ Swap : and ; to make colon commands easier to type ]======
nnoremap  ;  :
" nnoremap  :  ;

" }}}1
"
" Section: Visual {{{1
" --------------------
if (&t_Co > 2 || has("gui_running")) && has("syntax")
    if exists("&guifont")
        if has("mac")
            set guifont=Menlo:h11
        elseif has("unix")
            if &guifont == ""
                set guifont=bitstream\ vera\ sans\ mono\ 10
            endif
        elseif has("win32") || has("win64")
            set guifont=Consolas:h9,Courier\ New:h9
        endif
    endif
endif
" }}}1

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" vim:set ft=vim et sw=4
