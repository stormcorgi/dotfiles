#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
autoload -Uz promptinit
promptinit
prompt sorin

cd ~

# offline dictionary 
function dict() {
    grep $1 /usr/local/share/dict/gene-utf8.txt -A 1 -wi --color
}

# my man
function myman() {
    echo "my commands"
    echo " - dict : offline English -> Japanese dictionary"
    echo " - myman : show this message"
}
myman
