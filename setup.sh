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
/bin/zsh ./zsh_setup.sh

## vim section
/bin/sh ./vim_setup.sh

## peco section
/bin/bash ./peco_installer.sh

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


