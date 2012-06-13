if filereadable("/etc/vimrc")
    source /etc/vimrc
elseif filereadable("/etc/vim/vimrc")
    source /etc/vim/vimrc
endif

"色設定
colorscheme elflord 

set number
set tabstop=4
set shiftwidth=4
set expandtab
"vi互換off
set nocompatible

"不可視文字の表示
set list
"対応するカッコを表示
set showmatch
"カーソルは対応するカッコに飛ばない
set matchtime=0
set autoindent

"ctrl-c を ESCに置き換え
"ctrl-cとESCは挙動が違う 以下URL参照
"http://d.hatena.ne.jp/yuta84q/20101216/1292508997
inoremap <C-c> <ESC>

"コメント行で改行するとコメントを自動挿入する機能をOFF
autocmd FileType * setlocal formatoptions=cq
"編集中のファイルのステータスを常時表示
set laststatus=2

"バッファの移動
noremap <C-w>h <C-w><LEFT>
noremap <C-w>j <C-w><DOWN>
noremap <C-w>k <C-w><UP>
noremap <C-w>l <C-w><RIGHT>

"文字コード自動識別
set encoding=utf-8
set fileencodings=utf-8,euc_jp

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 10

"ファイルタイプによるシンタックス割り当て
autocmd BufRead, BufNewFile *.t setfiletype=perl

noremap fg :call Search_pm('vne')<Enter>
noremap ff :call Search_pm('e')<Enter>
noremap fd :call Search_pm('sp')<Enter>
noremap ft :call Search_pm('tabe')<Enter>

nnoremap <SPACE>c :! perl -wc -Ilib -It/inc %<ENTER>

function! _CheckPerlCode()
    exe ":! perl /home/bkapps/local/bin/async_syntax_checker.pl %"
endfunction
command! CheckCode call _CheckPerlCode()
autocmd BufWrite *.pl, *.pm, *.t :CheckCode

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'git://github.com/Shougo/echodoc.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vim-vcs.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/vinarise.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/eagletmt/ghcmod-vim.git'

filetype plugin indent on
