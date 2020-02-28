#!/bin/zsh
# requirements
# - zsh
# - git
# - curl
# - vim
# - nkf(for dict command)

## zsh section
# add submodule
git submodule update --init --recursive
# override zprezto dotfiles
ln -sf ~/dotfiles/zprezto ~/.zprezto
# prezto symlink in ~/
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/dotfiles/zsh/*(.N); do
     ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.zprezto/runcoms/${rcfile:t}"
     ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
echo "zsh initialize section done!"

## vim section
# vim dotfiles
ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
# create vim undo / swp / backup target dirctory
if [ ! -e ~/.vim/undo ];then
    echo "created undo/swp/backup target dir: ~/.vim/undo"
    mkdir -p ~/.vim/undo
fi
# Vundle install
if [ ! -e ~/.vim/bundle/Vundle.vim ];then
    echo "~/.vim/bundle/Vundle.vim not fonud. installing..."
    mkdir -p ~/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi
echo "vim initialize section done!"

# english -> japanese dictionary data set.
if [ ! -e ~/.dict/ ];then
    mkdir -p ~/.dict/
    curl -s -O http://www.namazu.org/%7Etsuchiya/sdic/data/gene95.tar.gz
    tar xzf ./gene95.tar.gz
    nkf gene.txt > ~/.dict/gene-utf8.txt
    rm -f gene.txt gene95.tar.gz
fi

# change shell
# chsh -s $(which zsh)

