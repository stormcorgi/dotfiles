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

## zsh section
# add submodule
git submodule update --init --recursive
# override zprezto dotfiles
ln -sf $script_dir/zprezto ~/.zprezto
# prezto symlink in ~/
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/dotfiles/zsh/*(.N); do
     ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.zprezto/runcoms/${rcfile:t}"
     ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
echo "zsh initialize section done!"

## vim section
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

# Vim colorsheme installation
mkdir -p ~/.vim/colors
git clone https://github.com/tomasr/molokai /tmp/molokai
mv /tmp/molokai/colors/molokai.vim ~/.vim/colors/

echo "vim initialize section done!"

# english -> japanese dictionary data set.
if [ ! -e ~/.dict/ ];then
    mkdir -p ~/.dict/
    cd ~/.dict/
    curl -s -O http://www.namazu.org/%7Etsuchiya/sdic/data/gene95.tar.gz
    tar xzf ./gene95.tar.gz
    nkf gene.txt > gene-utf8.txt
    rm -f gene.txt gene95.tar.gz readme.txt
    cd $CURDIR
fi

# create local zsh file.
touch ~/.zshrc.local

# change shell
ZSHBINPATH=$(cat /etc/shells | grep zsh | head -n 1)
if [ $SHELL != $ZSHBINPATH ]; then
    chsh -s $ZSHBINPATH
fi

cd $CURDIR
