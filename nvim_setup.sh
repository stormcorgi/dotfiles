#!/bin/bash
CURDIR=$(pwd)
script_dir=$(
	cd "$(dirname $0)" || exit
	pwd
)
cd "$script_dir" || exit

# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

cd "$CURDIR" || exit
