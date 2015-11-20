set relativenumber
set number
"show position
set ruler
"this is so it autoreads if file is changed
set autoread
"
"ignore case when searching
set ignorecase
"but enable it if you use capitals
set smartcase

"encoding is important
set encoding=utf8

"tab stuffs (the not-spaces kind, not the vim kind)"
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set wrap lbr

"change leading spaces to dots
"set list
"set listchars=trail:•

"change swap directory so it doesnt fuxx up my stuffs
set backupdir=~/.vim/backup//
set directory=~/.vim/backup//

"add bracket matching for html
set matchpairs +=<:>


"set shortmess=a

"set statusline so i can always see what file im working on
"set statusline=%f

"Use system clipboard (havent tested on mac, only X11"
set clipboard^=unnamed

"The following were rec'd by syntastic but i didn't like them
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"this one is for syntastic: close method/function preview after
"autocomplete
autocmd CompleteDone * pclose

"tell syntastic to use python2
let g:syntastic_python_python_exec = '/usr/bin/python2'
let g:syntastic_html_tidy_exec = 'tidy5'

"vim-airline plays better with the line after next
set laststatus=2
set noshowmode
"syntax keyword airline_tabmod_unsel a
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"
"lightline config
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! LightLineModified()
    return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
    return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightLineFilename()
    let fname = expand('%:t')
    return fname == 'ControlP' ? g:lightline.ctrlp_item :
                \ fname == '__Tagbar__' ? g:lightline.fname :
                \ fname =~ '__Gundo\|NERD_tree' ? '' :
                \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
                \ &ft == 'unite' ? unite#get_status_string() :
                \ &ft == 'vimshell' ? vimshell#get_status_string() :
                \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ ('' != fname ? fname : '[No Name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
    try
        if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
            let mark = ''  " edit here for cool mark
            let _ = fugitive#head()
            return strlen(_) ? mark._ : ''
        endif
    catch
    endtry
    return ''
endfunction

function! LightLineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
    let fname = expand('%:t')
    return fname == '__Tagbar__' ? 'Tagbar' :
                \ fname == 'ControlP' ? 'CtrlP' :
                \ fname == '__Gundo__' ? 'Gundo' :
                \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
                \ fname =~ 'NERD_tree' ? 'NERDTree' :
                \ &ft == 'unite' ? 'Unite' :
                \ &ft == 'vimfiler' ? 'VimFiler' :
                \ &ft == 'vimshell' ? 'VimShell' :
                \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
    if expand('%:t') =~ 'ControlP'
        call lightline#link('iR'[g:lightline.ctrlp_regex])
        return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
                    \ , g:lightline.ctrlp_next], 0)
    else
        return ''
    endif
endfunction

let g:ctrlp_status_func = {
            \ 'main': 'CtrlPStatusFunc_1',
            \ 'prog': 'CtrlPStatusFunc_2',
            \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
    let g:lightline.ctrlp_regex = a:regex
    let g:lightline.ctrlp_prev = a:prev
    let g:lightline.ctrlp_item = a:item
    let g:lightline.ctrlp_next = a:next
    return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
    return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
    return lightline#statusline(0)
endfunction

augroup AutoSyntastic
    autocmd!
    autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
    SyntasticCheck
    call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

function! CtrlPMark()
    if expand('%:t') =~ 'ControlP'
        call lightline#link('iR'[g:lightline.ctrlp_regex])
        return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
                    \ , g:lightline.ctrlp_next], 0)
    else
        return ''
    endif
endfunction
"end lightline config

"some syntax stuffs
syntax on
au BufNewFile,BufRead *.handlebars set filetype=html
au BufNewFile,BufRead *.ejs set filetype=html

"some remappings
imap jk <esc>
"I didn't like this but im keeping it here for posterity's sake
"vmap jk <esc>

"only works on mac
"command Paste :r !pbpaste

"Split stuffs
"made obsolete by dwm.vim
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

"because I'm an idiot"
command W :w

"remap leader to space
let mapleader = "\<Space>"

"faster movement to beginning/end of line
nnoremap <Leader>q ^
nnoremap <Leader>w $

"mind=blown
nnoremap ; :
nnoremap : ;

"buffer navigation stuffs"
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>p :bprevious<CR>
nnoremap <Leader>x :bdelete<CR>

"quickly close suntastic window
nnoremap <Leader>d :lclose<CR>
nnoremap <Leader>a :SyntasticToggleMode<CR>
nnoremap <Leader>s :SyntasticCheck<CR>

"for buffer movement - silence unwritten file warning
set hidden

"for tab-completion"
set nocompatible

""vundle stuffs"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"put vundle plugins here"

""let vundle manage vundle"
Plugin 'VundleVim/Vundle.vim'

""surround.vim, for sexy surround stuffs"
Plugin 'tpope/vim-surround'

"vim-repeat plays nicely with vim-surround
Plugin 'tpope/vim-repeat'

"NERDTREE for NRED CRED 
Plugin 'scrooloose/nerdtree'

""youcompleteme, for code completion"
Plugin 'valloric/YouCompleteMe'

""Plugin 'noah/vim256-color'

"TernJs for javascript completion
"Plugin 'marijnh/tern_for_vim'
"
"lightline.vim to replace airline
Plugin 'itchyny/lightline.vim'

"CtrlP because wizards
Plugin 'https://github.com/kien/ctrlp.vim'
"Extend CtrlP to use tabs
Plugin 'davidegx/ctrlp-smarttabs'

"Plugin 'pangloss/vim-javascript'

"Syntastic because JS is hard
Plugin 'scrooloose/syntastic'

"Super l33t statusline
"Plugin 'bling/vim-airline'

"Git integration
Plugin 'tpope/vim-fugitive'

"DWM+Vim 'you got vim in my tiling wm!' 'you got tiling wm in my vim!'
"Plugin 'spolu/dwm.vim'

"Goldenviw.vim - replacement for dwm.vim
Plugin 'zhaocai/GoldenView.vim'

"Readline Style Insertion
Plugin 'tpope/vim-rsi'

"Indentation guide
Plugin 'nathanaelkane/vim-indent-guides'

"Ag for sexy searchin
Plugin 'rking/ag.vim'

call vundle#end()

"disable default goldenview (interferes w ctrlp)
let g:goldenview__enable_default_mapping = 0
" Then set goldenview settings
" 1. split to tiled windows
nmap <silent> <C-N>  <Plug>GoldenViewSplit

" 2. quickly switch current window with the main pane
" and toggle back
nmap <silent> <F8>   <Plug>GoldenViewSwitchMain
nmap <silent> <S-F8> <Plug>GoldenViewSwitchToggle

" 3. jump to next and previous window
nmap <silent> <C-J>  <Plug>GoldenViewNext
nmap <silent> <C-K>  <Plug>GoldenViewPrevious

nnoremap <Leader>t :NERDTree<CR>
let g:NERDTreeDirArrows=1

"ctrlp settings
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
"
" lol nvm map <C-u> :CtrlPMRU<CR>
"map <Leader>i :CtrlPSmartTabs<CR>

map <Leader>o :CtrlPBuffer<CR>
"use the working directory as ctrlp's root directory 
let g:ctrlp_working_path_mode = 0
let g:ctrlp_extensions = ['smarttabs']
"let ctrlp use ag
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"let g:ctrlp_use_caching = 0

filetype plugin indent on

set t_Co=256
colorscheme hybrid 
