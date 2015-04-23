set number
"show position
set ruler
"this is so it autoreads if file is changed
set autoread
"move 7 lines with j/k
set so=7
"ignore case when searching
set ignorecase
"tab stuffs"
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
"j/k navigate display lines on wrapped text
set wrap lbr
colorscheme desert
syntax on
"some remappings
imap jk <esc>
"only works on mac
command Paste :r !pbpaste
"because I'm an idiot"
command W :w
"buffer navigation stuffs"
nnoremap <C-n> :bnext<CR>
nnoremap <C-b> :bprevious<CR>
nnoremap <C-c> :bdelete<CR>
"for buffer movement - silence unwritten file warning
set hidden
"for tab-completion"
set nocompatible

"vundle stuffs"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"put vundle plugins here"

"let vundle manage vundle"
Plugin 'gmarik/Vundle.vim'

"surround.vim, for sexy surround stuffs"
Plugin 'tpope/vim-surround'

"youcompleteme, for code completion"
"Plugin 'valloric/YouCompleteMe'

Plugin 'pangloss/vim-javascript'

call vundle#end()
filetype plugin indent on
