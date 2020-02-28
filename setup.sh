#!/bin/zsh

# add submodule
git submodule update --init --recursive
# override zprezto dotfiles
ln -sf ~/dotfiles/zprezto ~/.zprezto
ln -sf ~/dotfiles/zsh/zlogin ~/.zpreztorc/runcoms/zlogin
ln -sf ~/dotfiles/zsh/zlogout ~/.zpreztorc/runcoms/zlogout
ln -sf ~/dotfiles/zsh/zpreztorc ~/.zpreztorc/runcoms/zpreztorc
ln -sf ~/dotfiles/zsh/zprofile ~/.zpreztorc/runcoms/zprofile
ln -sf ~/dotfiles/zsh/zshenv ~/.zpreztorc/runcoms/zshenv
ln -sf ~/dotfiles/zsh/zshrc ~/.zpreztorc/runcoms/zshrc
# prezto symlink in ~/
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
     ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# vim dotfiles
ln -sf ~/dotfiles/vim/vimrc ~/.vimrc

# change shell
chsh -s $(which zsh)

