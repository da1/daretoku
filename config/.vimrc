source /etc/vimrc

"色設定
colorscheme darkblue

set number
set tabstop=4
set shiftwidth=4
set expandtab

"不可視文字の表示
set list
"対応するカッコを表示
set showmatch

"ctrl-c を ESCに置き換え
"ctrl-cとESCは挙動が違う 以下URL参照
"http://d.hatena.ne.jp/yuta84q/20101216/1292508997
inoremap <C-c> <ESC>

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 10

"コメント行で改行するとコメントを自動挿入する機能をOFF
autocmd FileType * setlocal formatoptions=cq

"Vimでのschemeプログラミング参照
"http://d.hatena.ne.jp/lemniscus/20120409/1333942456
filetype plugin indent on

"カッコの対応表示
set showmatch
"カーソルは対応するカッコに飛ばない
set matchtime=0

set autoindent
"Schemeファイルのときにオートインデント
autocmd FileType scheme setlocal autoindent
"--

"文字コード自動識別
set encoding=utf-8
set fileencodings=euc_jp,utf-8

"ファイルタイプによるシンタックス割り当て
augroup filetypedetect
    au! BufRead,BufNewFile *.t setfiletype perl
augroup END

