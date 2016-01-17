#!/usr/bin/env zsh

export EDITOR=nano
export VISUAL=subl

export PATH="/usr/local/sbin:$PATH:/usr/local/share/pypy"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export HOMEBREW_BUILD_FROM_SOURCE=1

alias update='sudo softwareupdate -i -a; brew update; brew upgrade --all; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update'

if (( $+commands[grc] )) && (( $+commands[brew] ))
then
  source "$(brew --prefix)/etc/grc.bashrc"
fi

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

