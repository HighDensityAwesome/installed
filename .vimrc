set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

syntax enable
set number
set background=dark
colorscheme solarized
set hls "highlighting!
set incsearch "search begins as soon as you start typing instead of waiting for <ENTER>
set backspace=indent,eol,start
"change tabs directionaly with ^h and ^l
nnoremap <C-h> gT 
nnoremap <C-h> gt
"rebind for space: prime real estate wated by default
map <space> <ESC>

"slimux
"I have this built into the script, which is not what the original has
nnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>
vnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>
nnoremap <C-c><C-v> :SlimuxREPLConfigure<CR>

"paste formatted time
"nnoremap t "=strftime('%Y-%m-%d %H:%M:%S')<CR>P

set mouse=a "mouse functionality
let g:solarized_termcolors = 16
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"

Plugin 'VundleVim/Vundle.vim'
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Plugin 'ivanov/vim-ipython'
Plugin 'gioele/vim-autoswap' 
Plugin 'jez/vim-superman'
Plugin 'epeli/slimux'

nnoremap ; :

call vundle#end()
filetype plugin indent on

nnoremap <c-n> :%s///g<left><left>

let g:autoswap_detect_tmux = 1

