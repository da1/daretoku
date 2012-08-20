if filereadable("/etc/vimrc")
    source /etc/vimrc
elseif filereadable("/etc/vim/vimrc")
    source /etc/vim/vimrc
endif

if filereadable(expand('$HOME/.vimrc.local'))
    source $HOME/.vimrc.local
endif

"vi互換off
set nocompatible
set number
set tabstop=4
set shiftwidth=4
set expandtab

"不可視文字の表示
set list listchars=tab:^_,trail:_
"全角スペースをハイライト
scriptencoding utf-8
augroup highlightIdegraphicSpace
    autocmd!
    autocmd ColorScheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
    autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END
"色設定
colorscheme elflord

"対応するカッコを表示
set showmatch
"カーソルは対応するカッコに飛ばない
set matchtime=0
set autoindent

"コメント行で改行するとコメントを自動挿入する機能をOFF
autocmd FileType * setlocal formatoptions=cq
"編集中のファイルのステータスを常時表示
set laststatus=2

"文字コード自動識別
set encoding=utf-8
set fileencodings=utf-8,euc_jp

".viminfo
set viminfo='1000,<500

"ファイルタイプによるシンタックス割り当て
autocmd BufNewFile,BufRead *.t set filetype=perl
autocmd BufNewFile,BufRead *.scala set filetype=scala

"==================== keybind ====================
"ctrl-c を ESCに置き換え
"ctrl-cとESCは挙動が違う 以下URL参照
"http://d.hatena.ne.jp/yuta84q/20101216/1292508997
inoremap <C-c> <ESC>

imap <C-m> <enter>

"バッファの移動
noremap <C-w>h <C-w><LEFT>
noremap <C-w>j <C-w><DOWN>
noremap <C-w>k <C-w><UP>
noremap <C-w>l <C-w><RIGHT>

"行頭、行末移動
noremap <C-a> ^
noremap <C-e> $
noremap <C-i> <C-a>

"一時ファイルを開く
command! Tmp :edit `=tempname()`

"ヤンクした文字列とカーソル位置の単語を置換する
nnoremap <silent> cy ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
"カーソルが単語内のどこにあってもヤンクした文字列と置換する
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

"<C-c> 2回押しで，検索ハイライトを消去
nnoremap <C-c><C-c> :nohlsearch<CR>

nnoremap <SPACE>c :! perl -wc -Ilib -It/inc %<ENTER>

"==================== showmarks.vim ====================
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

"==================== neocomplcache ====================
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Use camel case completion.

let g:neocomplcache_max_list = 10
let g:neocomplcache_dictionary_filetype_lists = {'perl' : $HOME . '/.vim/dict/perl.dict'}
"$ wget https://raw.github.com/Cside/dotfiles/master/.vim/dict/perl.dict

"$ mkdir ~/.vim/snippets
"$ cd ~/.vim/snippets
"$ wget https://raw.github.com/gist/2146105/464170751812997fc3b655cb547e2b5a929e9eb6/perl.snip

let g:neocomplcache_snippets_dir = $HOME . '/.vim/snippets'
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default'    : '',
    \ 'perl'       : $HOME . '/.vim/dict/perl.dict'
    \ }

let g:neocomplcache_ctags_arguments_list = {
    \ 'perl' : '-R -h ".pm"'
    \ }

" select with <TAB>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

"==================== snippets ====================
imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-n>"
smap <C-k> <Plug>(neocomplcache_snippets_expand)

"==================== syntastic ====================
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1

if has('vim_starting')
    let $PERL5LIB='./lib:./t:./t/inc:'.expand('$PERL5LIB')
endif

"==================== LoadTest ====================
noremap <C-t> :call LoadTest('bel vne')<ENTER>
noremap <C-l> :call LoadTest('bel vne', 'directory')<ENTER>

"==================== unite.vim ====================
let g:unite_enable_start_insert = 1 "入力モードで開始する
let g:unite_enable_split_vertically = 1 "縦分割で開く
"unite prefix key
"unite mappings
nnoremap ,f :<C-u>Unite file -completion<CR>
nnoremap ,b :<C-u>Unite buffer -completion<CR>
nnoremap ,h :<C-u>Unite file_mru -completion<CR>

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" 新しいタブで開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-T> unite#do_action('tabopen')
au FileType unite inoremap <silent> <buffer> <expr> <C-T> unite#do_action('tabopen')

"==================== vimfiler ====================
let g:vimfiler_as_default_explorer=1

"==================== fugative ====================
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

"==================== operator replace ====================
map R <Plug>(operator-replace)

"==================== VimShell ====================
",vs: シェルを起動
nnoremap <silent> ,vs :VimShell<CR>
",vv: 画面を縦分割してシェルを起動
nnoremap <silent> ,vv :VimShell -split<CR>

"==================== YankRing ====================
let g:yankring_history_dir = expand('$HOME')
let g:yankring_history_file = '.yankring_history'

"==================== indent-guides ====================
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=green
hi IndentGuidesEven ctermbg=green

"==================== vim-funlib ====================
":put! =Random(0,100)
function! Random(a, b)
    return random#randint(a:a, a:b)
endfunction

function! MD5(data)
    return hashlib#md5(a:data)
endfunction

function! Sha1(data)
    return hashlib#sha1(a:data)
endfunction

function! Sha256(data)
    return hashlib#sha256(a:data)
endfunction

"==================== toggle ====================
"+ で切り替え
let g:toggle_pairs = {
    \ 'and': 'or', 'or': 'and',
    \ 'if': 'elsif', 'elsif': 'else', 'else': 'if'
    \ }

"==================== jump2pm ====================
noremap fg :call Jump2pm('vne')<Enter>
noremap ff :call Jump2pm('e')<Enter>
noremap fd :call Jump2pm('sp')<Enter>
noremap ft :call Jump2pm('tabe')<Enter>

"==================== NeoBundle ====================
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
NeoBundle 'git://github.com/Shougo/neocomplcache-snippets-complete.git'
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
NeoBundle 'git://github.com/thinca/vim-ref.git'
NeoBundle 'git://github.com/kana/vim-operator-user.git'
NeoBundle 'git://github.com/kana/vim-operator-replace.git'
NeoBundle 'git://github.com/vim-scripts/YankRing.vim.git'
NeoBundle 'git://github.com/thinca/vim-visualstar.git'
NeoBundle 'git://github.com/nathanaelkane/vim-indent-guides.git'
NeoBundle 'git://github.com/ynkdir/vim-funlib.git'
NeoBundle 'git://github.com/taku-o/vim-toggle.git'
NeoBundle 'git://github.com/nakatakeshi/jump2pm.vim.git'
NeoBundle 'git://github.com/mileszs/ack.vim.git'

"HTML
NeoBundle 'git://github.com/mattn/zencoding-vim.git'

"git
NeoBundle 'git://github.com/tpope/vim-fugitive.git'
NeoBundle 'git://github.com/gregsexton/gitv.git'
NeoBundle 'git://github.com/vim-scripts/extradite.vim.git'

"haskell
NeoBundle 'git://github.com/eagletmt/ghcmod-vim.git'
NeoBundle 'git://github.com/ujihisa/neco-ghc.git'

filetype on

"============================================================
