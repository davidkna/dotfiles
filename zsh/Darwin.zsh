#!/usr/bin/env zsh

export EDITOR=nano
export VISUAL=subl

export PATH="PATH=$PATH:/usr/local/sbin:/usr/local/share/pypy:${HOME}/.cargo/bin"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

alias update='sudo softwareupdate -i -a; brew update; brew upgrade --all; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; gem update'

if (( $+commands[grc] )) && (( $+commands[brew] ))
then
  source "$(brew --prefix)/etc/grc.bashrc"
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
