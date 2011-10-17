set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'kana/vim-surround'
Bundle 'h1mesuke/vim-alignta'
Bundle 'endwise.vim'

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

filetype plugin indent on     " required!

set encoding=utf-8
set termencoding=utf-8
syntax on
set number wrap incsearch nobackup expandtab shiftwidth=2 softtabstop=2 autoindent
let g:Align_xstrlen = 3
set ambiwidth=double
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%=%l,%c%v%8p
set laststatus=2

noremap ; :
noremap : ;

"set ft=vim:
"highlight EOLSpace ctermbg=red guibg=red

" 全角空白と行末の空白の色を変える
highlight WideSpace ctermbg=blue guibg=blue
highlight EOLSpace ctermbg=red guibg=red

function! s:HighlightSpaces()
  syntax match WideSpace // containedin=ALL
  syntax match EOLSpace /\s\+$/ containedin=ALL
endf

function! TrailingSpace()
  % s/\s\+$//
endfunction
command! TrailingSpace :call TrailingSpace()

autocmd WinEnter,BufRead,BufEnter * call s:HighlightSpaces()
