set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

syntax enable
set number
set background=dark
colorscheme solarized
let g:solarized_termcolors = 16
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"

Plugin 'VundleVim/Vundle.vim'
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'

nnoremap ; :

call vundle#end()
filetype plugin indent on
