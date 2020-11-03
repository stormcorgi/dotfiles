#!/bin/zsh
# requirements
# - zsh
# - git
# - curl
# - vim
# - cowsay(for zlogin)
# - figlet(for zlogin)
# - peco(better cd / Ctrl-R)

script_dir=$(cd $(dirname $0); pwd)
CURDIR=$PWD

cd $script_dir

# install dependency
## apt
type apt > /dev/null 2>&1 
if [ $? -eq 0 ]; then
   yes | sudo apt install zsh git curl vim cowsay figlet peco
fi

## apt
type yum > /dev/null 2>&1 
if [ $? -eq 0 ]; then
   yes | sudo yum install -y epel-release
   yes | sudo yum update
   yes | sudo yum -y install zsh git curl vim cowsay figlet
fi

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
/bin/sh ./vim_setup.sh

# create local zsh file.
touch ~/.zshrc.local

# change shell
ZSHBINPATH=$(cat /etc/shells | grep zsh | head -n 1)
if [ $SHELL != $ZSHBINPATH ]; then
    chsh -s $ZSHBINPATH
fi

cd $CURDIR


