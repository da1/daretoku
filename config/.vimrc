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

noremap <C-a> ^
noremap <C-e> $

"文字コード自動識別
set encoding=utf-8
set fileencodings=utf-8,euc_jp

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 10
let g:neocomplcache_dictionary_filetype_lists = {'perl' : $HOME . '/.vim/dict/perl.dict'}

"ファイルタイプによるシンタックス割り当て
autocmd BufRead, BufNewFile *.t setfiletype=perl

noremap fg :call Search_pm('vne')<Enter>
noremap ff :call Search_pm('e')<Enter>
noremap fd :call Search_pm('sp')<Enter>
noremap ft :call Search_pm('tabe')<Enter>

nnoremap <SPACE>c :! perl -wc -Ilib -It/inc %<ENTER>

"===== syntastic =====
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1

"
noremap <C-t> :call LoadTest('bel vne')<ENTER>
noremap <C-l> :call LoadTest('bel vne', 'directory')<ENTER>

"===== unite.vim =====
let g:unite_enable_start_insert = 1 "入力モードで開始する
let g:unite_enable_split_vertically = 1 "縦分割で開く
"unite prefix key
"unite mappings
nnoremap ,f :<C-u>Unite file -completion<CR>
nnoremap ,b :<C-u>Unite buffer -completion<CR>
nnoremap ,h :<C-u>Unite file_mru -completion<CR>

"===== NeoBundle =====
"http://vim-users.jp/2011/10/hack238/
":NeoBundleInstall
":NeoBundleInstall!

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

filetype off

NeoBundle 'git://github.com/Shougo/echodoc.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
"http://d.hatena.ne.jp/s_yamaz/20110108/1294493899
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vim-vcs.git'
"http://d.hatena.ne.jp/h1mesuke/20100611/p1
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
"http://d.hatena.ne.jp/alwei/20120220/1329756198
NeoBundle 'git://github.com/Shougo/vinarise.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'Align'
NeoBundle 'git://github.com/vim-jp/vimdoc-ja.git'
"https://github.com/tpope/vim-surround
NeoBundle 'git://github.com/tpope/vim-surround.git'
NeoBundle 'git://github.com/scrooloose/syntastic.git'

"git
NeoBundle 'git://github.com/tpope/vim-fugitive.git'
NeoBundle 'git://github.com/gregsexton/gitv.git'
NeoBundle 'git://github.com/vim-scripts/extradite.vim.git'

"haskell
NeoBundle 'git://github.com/eagletmt/ghcmod-vim.git'

filetype on

"=====================
