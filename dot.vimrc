set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'kana/vim-surround'
Bundle 'h1mesuke/vim-alignta'
Bundle 'endwise.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'Shougo/unite.vim'
Bundle 'h1mesuke/unite-outline'
Bundle 'tsukkee/unite-help'
Bundle 'basyura/unite-rails'
Bundle 'moro/unite-stepdefs'
Bundle 'kchmck/vim-coffee-script'
Bundle 'coffee.vim'

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

filetype plugin indent on     " required!

set encoding=utf-8
set termencoding=utf-8
syntax on
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jisx0213,euc-jp-ms,euc-jp
set number wrap incsearch nobackup expandtab shiftwidth=2 softtabstop=2 autoindent
let g:Align_xstrlen = 3
set ambiwidth=double
set laststatus=2
set ignorecase
set smartcase
let &statusline = ''
let &statusline .='%<[%n]%f %h%m%r%w'
let &statusline .= '%='
let &statusline .= '%{fugitive#statusline()}[%{( &l:fileencoding == "" ?  &encoding : &l:fileencoding ).":".&fileformat}]%y'
let &statusline .= ' %-14.(%l,%c%V%) %P'

set ft=vim:
"highlight EOLSpace ctermbg=red guibg=red
highlight Comment ctermfg=DarkCyan
set hlsearch

" 全角空白と行末の空白の色を変える
highlight WideSpace ctermbg=blue guibg=blue
highlight EOLSpace ctermbg=red guibg=red

function! s:HighlightSpaces()
  syntax match WideSpace /　/ containedin=ALL
  syntax match EOLSpace /\s\+$/ containedin=ALL
endf
autocmd WinEnter,BufRead,BufEnter * call s:HighlightSpaces()

function! TrailingSpace()
  % s/\s\+$//
endfunction
command! TrailingSpace :call TrailingSpace()

function! s:SetupSpeCuke()
  command! RunTestFile exe '!sc ' . expand('%:p')
  command! RunTestCase exe '!sc --line ' . line('.') . ' ' . expand('%:p')

  nnoremap -tf :RunTestFile<CR>
  nnoremap -tc :RunTestCase<CR>
endfunction

au BufRead,BufNewFile *_spec.rb,*.feature call s:SetupSpeCuke()

" unite
 let g:unite_source_file_ignore_pattern = '\v\~$|\.(o|exe|bak|swp|gif|jpg|png)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
 let g:unite_source_file_mru_ignore_pattern = '\v\~$|\.(o|exe|bak|swp|gif|jpg|png)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
 let g:unite_winheight = 10
 let g:unite_source_file_mru_time_format = "%Y-%m-%dT%H:%M:%S "
 nnoremap <Space>f :Unite file<CR>
 nnoremap <Space>r :UniteWithBufferDir file<CR>
 nnoremap <Space>b :Unite buffer<CR>
 nnoremap <Space>B :Unite file_mru<CR>
 nnoremap <Space>l :Unite outline<CR>
 nnoremap <Space>s :Unite stepdefs<CR>
