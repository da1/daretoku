set number
set tabstop=4
set expandtab

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

