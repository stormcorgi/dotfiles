#!/bin/bash

mkdir -p ~/.config/wezterm
ln -sf "${HOME}/dotfiles/wezterm/wezterm.lua" "${HOME}/.config/wezterm/wezterm.lua"
cp "${HOME}/dotfiles/localconf.lua" "${HOME}/.config/wezterm/localconf.lua"
