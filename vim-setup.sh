#!/bin/zsh
# requirements
# - zsh
# - git
# - curl
# - vim
# - nkf(for dict command)
# - cowsay(for zlogin)
# - figlet(for zlogin)

script_dir=$(cd $(dirname $0); pwd)
CURDIR=$PWD

cd $script_dir

## vim section
# Vim colorsheme installation
mkdir -p ~/.vim/colors
git clone https://github.com/tomasr/molokai /tmp/molokai
mv /tmp/molokai/colors/molokai.vim ~/.vim/colors/
rm -rf /tmp/molokai

# vim dotfiles
ln -sf $script_dir/vim/vimrc ~/.vimrc

# create vim undo / swp / backup target dirctory
if [ ! -e ~/.vim/undo ];then
    echo "created undo/swp/backup target dir: ~/.vim/undo"
    mkdir -p ~/.vim/undo
fi

# Vundle install
# vim-lsp require ~/.cache/tmp
mkdir -p ~/.cache/tmp
if [ ! -e ~/.vim/bundle/Vundle.vim ];then
    echo "~/.vim/bundle/Vundle.vim not fonud. installing..."
    mkdir -p ~/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi

echo "vim initialize section done!"

cd $CURDIR
