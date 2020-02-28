" vim一般
set encoding=utf-8
scriptencoding utf-8
filetype plugin indent on
set nowrap
set hlsearch
set ignorecase
set smartcase
set autoindent
set ruler
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set wildmenu
set showcmd
set shiftwidth=4
set softtabstop=4
set expandtab
set tabstop=4
set smarttab
" ヤンクやペースト時クリップボードの内容を使用する
set clipboard=unnamed,autoselect
" バッファの自動保存
set autowrite
autocmd CursorHold * wall
autocmd CursorHoldI * wall
"文字コードをUFT-8に設定
set fenc=utf-8
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" スペルチェックに日本語を含まない
set spelllang+=cjk
" buffer切り替えをC-j,C-kへ
noremap <silent> <C-j> :bprev<CR>
noremap <silent> <C-k> :bnext<CR>
" swp/backup/undoファイル出力先
set directory=~/.vim/undo
set backupdir=~/.vim/undo
set undodir=~/.vim/undo



" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" シンタックスハイライトの有効化
syntax enable


" Tab系
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" 外部コマンドでバッファ内のpythonコードを実行する
autocmd BufNewFile,BufRead,BufEnter *.py nnoremap <C-e> :!python %

" Vim標準のファイルツリー表示を使う
filetype plugin on
" ファイルツリーの表示形式、1にするとls -laのような表示になります
let g:netrw_liststyle=1
" ヘッダを非表示にする
let g:netrw_banner=0
" サイズを(K,M,G)で表示する
let g:netrw_sizestyle="H"
" 日付フォーマットを yyyy/mm/dd(曜日) hh:mm:ss で表示する
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
" プレビューウィンドウを垂直分割で表示する
let g:netrw_preview=1
