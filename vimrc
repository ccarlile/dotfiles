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

colorscheme Tomorrow-Night-Bright 

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
syntax keyword airline_tabmod_unsel a
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

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
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>

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
Plugin 'gmarik/Vundle.vim'

""surround.vim, for sexy surround stuffs"
Plugin 'tpope/vim-surround'

"vim-repeat plays nicely with vim-surround
Plugin 'tpope/vim-repeat'

"NERDTREE for NRED CRED 
Plugin 'scrooloose/nerdtree'

""youcompleteme, for code completion"
Plugin 'valloric/YouCompleteMe'

"TernJs for javascript completion
Plugin 'marijnh/tern_for_vim'

"CtrlP because wizards
Plugin 'https://github.com/kien/ctrlp.vim'
"Extend CtrlP to use tabs
Plugin 'davidegx/ctrlp-smarttabs'

"Plugin 'pangloss/vim-javascript'

"Syntastic because JS is hard
Plugin 'scrooloose/syntastic'

"Super l33t statusline
Plugin 'bling/vim-airline'

"Git integration
Plugin 'tpope/vim-fugitive'

"DWM+Vim 'you got vim in my tiling wm!' 'you got tiling wm in my vim!'
Plugin 'spolu/dwm.vim'

"Readline Style Insertion
Plugin 'tpope/vim-rsi'

"Indentation guide
Plugin 'nathanaelkane/vim-indent-guides'

"Ag for sexy searchin
Plugin 'rking/ag.vim'

call vundle#end()

nnoremap <Leader>t :NERDTree<CR>
let g:NERDTreeDirArrows=0

"ctrlp settings
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
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
