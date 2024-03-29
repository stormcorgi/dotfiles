#!/bin/zsh
# requirements
# - zsh
# - git
# - curl
# - vim
# - jq
# - cowsay(for zlogin)
# - figlet(for zlogin)
# - peco(better cd / Ctrl-R)
# - nkf(for dict)

script_dir=$(
    cd $(dirname $0)
    pwd
)
CURDIR=$PWD

cd $script_dir

# install dependency
## apt
type apt >/dev/null 2>&1
if [ $? -eq 0 ]; then
    yes | sudo apt install zsh git curl vim cowsay figlet peco jq nkf
fi

## yum
type yum >/dev/null 2>&1
if [ $? -eq 0 ]; then
    yes | sudo yum install -y epel-release
    yes | sudo yum update
    yes | sudo yum -y install zsh git curl vim cowsay figlet jq nkf
fi

## zsh section
/bin/zsh ./zsh_setup.sh

## vim section
/bin/bash ./vim_setup.sh

## peco section
/bin/bash ./peco_installer.sh

# create local zsh file.
touch ~/.zshrc.local

# change shell
ZSHBINPATH=$(cat /etc/shells | grep zsh | head -n 1)
if [ $SHELL != $ZSHBINPATH ]; then
    chsh -s $ZSHBINPATH
fi

cd $CURDIR
