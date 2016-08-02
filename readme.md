cloneしたら

cd
 ln -s ~/vimrc.backup/after/ftplugin/ ~/.vim/after/
 ln -s ~/vimrc.backup/.vimrc ~/.vimrc
でシンボリックリンクを作成する

mkdir ~/vimbackup
でバックアップ用のフォルダを作成

git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
でneobundleをインストール

mkdir ~/.vim/colors
でカラースキーマ用フォルダーを作成

git clone https://github.com/w0ng/vim-hybrid
でhybridのカラースキーマをダウンロード


