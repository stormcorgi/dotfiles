#!/bin/sh
CURDIR=$(pwd)
script_dir=$(
    cd "$(dirname $0)" || exit
    pwd
)
cd "$script_dir" || exit

## vim section
# vim dotfiles
ln -sf "$script_dir"/vim/vimrc ~/.vimrc
# create vim undo / swp / backup target dirctory
if [ ! -e ~/.vim/undo ]; then
    echo "created undo/swp/backup target dir: ~/.vim/undo"
    mkdir -p ~/.vim/undo
    echo "tmpdir(~/.vim/undo) generated."
fi

# Vim colorsheme installation
if [ ! -e ~/.vim/colors ]; then
    mkdir -p ~/.vim/colors
fi
git clone https://github.com/tomasr/molokai /tmp/molokai
mv /tmp/molokai/colors/molokai.vim ~/.vim/colors/
rm -rf /tmp/molokai

# Vundle install
# vim-lsp require ~/.cache/tmp
mkdir -p ~/.cache/tmp
if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
    echo "$HOME/.vim/bundle/Vundle.vim not fonud. installing..."
    mkdir -p ~/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
# plugin check
vim +PluginInstall +qall
echo "Vundle install done."


echo "vim initialize section done!"

cd "$CURDIR" || exit
