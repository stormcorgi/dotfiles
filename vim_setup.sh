#!/bin/sh
CURDIR=$(pwd)
script_dir=$(
    cd "$(dirname $0)" || exit
    pwd
)
cd "$script_dir" || exit

## vim section
ln -sf "$script_dir"/vim/vimrc ~/.vimrc
# create vim undo / swp / backup target dirctory
if [ ! -e ~/.vim/undo ]; then
    echo "create tmpdir(~/.vim/undo) for undo/swp/backup"
    mkdir -p ~/.vim/undo
    echo "tmpdir generated."
fi

# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

cd "$CURDIR" || exit
