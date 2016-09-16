#!/usr/bin/env zsh

export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"

export EDITOR="vim -e"
export VISUAL=vim


alias update='sudo dnf upgrade; sudo npm update -g; sudo gem update --system; sudo gem update'

alias 1pw=" passcards -v ~/Dropbox/1Password/1Password.agilekeychain"
