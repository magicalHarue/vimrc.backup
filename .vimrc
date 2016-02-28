"--------------------
" 基本的な設定
"--------------------
""新しい行のインデントを現在行と同じにする
set autoindent

"バックアップファイルのディレクトリを指定する
set backupdir=$HOME/vimbackup

"クリップボードをWindowsと連携する
set clipboard=unnamed

"vi互換をオフする
set nocompatible

"スワップファイル用のディレクトリを指定する
set directory=$HOME/vimbackup

"タブの代わりに空白文字を指定する
"set expandtab

"タブ幅の設定
set tabstop=2

set shiftwidth=2

"バックスペース有効化
set backspace=indent,eol,start

"変更中のファイルでも、保存しないで他のファイルを表示する
set hidden

"インクリメンタルサーチを行う
set incsearch

"行番号を表示する
set number

"閉括弧が入力された時、対応する括弧を強調する
set showmatch

"新しい行を作った時に高度な自動インデントを行う
set smarttab

" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

"...
"キーバインド
"...

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>
"モード切り替えを変更
inoremap jk  <Esc>
nnoremap <C-j> :vs<CR>

" vimgrepやgrep した際に、cwindowしてしまう
autocmd QuickFixCmdPost *grep* cwindow

" エスケープシーケンスの表示 tab eol
set list
set listchars=tab:>-,trail:~

" 全角スペースの表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkGray gui=reverse guifg=DarkGray
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        "ZenkakuSpace をカラーファイルで設定するなら、
        "次の行をコメントアウト
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

"
" NeoBundle
"
"
" NeoBundle がインストールされていない時、
" もしくは、プラグインの初期化に失敗した時の処理
" viだと読み込まない

if 1

function! s:WithoutBundles()
		"colorscheme dessert
		" その他の処理
endfunction

" NeoBundle よるプラグインのロードと各プラグインの初期化
function! s:LoadBundles()
		" 読み込むプラグインの指定
		NeoBundle 'Shougo/neobundle.vim'
		
		NeoBundle 'tpope/vim-surround'
		NeoBundle 'Shougo/unite.vim'
		NeoBundle 'Shougo/vimfiler.vim'
		NeoBundle 'itchyny/lightline.vim'
		NeoBundle 'w0ng/vim-hybrid'
		NeoBundle 'scrooloose/nerdtree'
		NeoBundle 'osyo-manga/vim-brightest'
		NeoBundle 'Townk/vim-autoclose'
		NeoBundle 'thinca/vim-quickrun'
		NeoBundle 'scrooloose/syntastic'

		" ...
		" 読み込んだプラグインの設定
		" ...

		" colorscheme setting
		set t_Co=256
		set background=dark
		colorscheme hybrid

		"lightline setting
		set laststatus=2
		let g:lightline = {
		      \ 'colorscheme': 'jellybeans'
		      \ }
		" syntastic setting
		" "JavaScriptのSyntaxチェックはjshintで
		let g:syntastic_javascript_checker = "jshint"
		"ファイルオープン時にはチェックをしない
		let g:syntastic_check_on_open = 0
		"ファイル保存時にはチェックを実施
		let g:syntastic_check_on_save = 1

endfunction

" NeoBundle がインストールされているなら LoadBundles() を呼び出す
" そうでないなら WithoutBundles() を呼び出す
function! s:InitNeoBundle()
		if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
				filetype plugin indent off
				if has('vim_starting')
						set runtimepath+=~/.vim/bundle/neobundle.vim/
				endif
				try
						call neobundle#begin(expand('~/.vim/bundle/'))
						call s:LoadBundles()
						call neobundle#end()
				catch
						call s:WithoutBundles()
				endtry 
		else
				call s:WithoutBundles()
		endif

		filetype indent plugin on
		syntax on
		NeoBundleCheck
endfunction

call s:InitNeoBundle()

endif
