#!/bin/zsh
# requirements
# - zsh
# - git
# - curl
# - vim
# - cowsay(for zlogin)
# - figlet(for zlogin)

script_dir=$(cd $(dirname $0); pwd)
CURDIR=$PWD

cd $script_dir

# install dependency
## apt
type apt > /dev/null 2>&1 
if [ $? -eq 0 ]; then
   yes | sudo apt install zsh git curl vim cowsay figlet

## apt
type yum > /dev/null 2>&1 
if [ $? -eq 0 ]; then
   yes | sudo yum install -y epel-release
   yes | sudo yum update
   yes | sudo yum -y install zsh git curl vim cowsay figlet

## zsh section
# add submodule
git submodule update --init --recursive
# override zprezto dotfiles
ln -sf $script_dir/zprezto ~/.zprezto
# prezto symlink in ~/
setopt EXTENDED_GLOB
for rcfile in "$script_dir"/dotfiles/zsh/*(.N); do
     ln -sf "$rcfile" "$script_dir/.zprezto/runcoms/${rcfile:t}"
     ln -sf "$rcfile" "$script_dir/.${rcfile:t}"
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
rm -rf /tmp/molokai

echo "vim initialize section done!"

# create local zsh file.
touch ~/.zshrc.local

# change shell
ZSHBINPATH=$(cat /etc/shells | grep zsh | head -n 1)
if [ $SHELL != $ZSHBINPATH ]; then
    chsh -s $ZSHBINPATH
fi

cd $CURDIR
