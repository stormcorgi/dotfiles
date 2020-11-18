#!/bin/zsh
script_dir=$(
    cd $(dirname $0)
    pwd
)
CURDIR=$PWD

cd $script_dir
echo $script_dir

## zsh section
# add submodule
git submodule update --init --recursive

# override zprezto dotfiles
ln -sf $script_dir/zprezto ~/.zprezto

# prezto symlink in ~/
setopt EXTENDED_GLOB
for rcfile in $script_dir/zsh/*(.N); do
    # echo "$rcfile" "$HOME/.zprezto/runcoms/${rcfile:t}"
    # echo "$rcfile" "$HOME/.${rcfile:t}"
    ln -sf "$rcfile" "$HOME/.zprezto/runcoms/${rcfile:t}"
    ln -sf "$rcfile" "$HOME/.${rcfile:t}"
done

echo "zsh initialize section done!"

cd $CURDIR
