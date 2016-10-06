#!/usr/bin/env zsh

export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"

export EDITOR="vim -e"
export VISUAL=code


alias update='sudo dnf upgrade -y; sudo npm update -g; sudo gem update --system; gem update'
