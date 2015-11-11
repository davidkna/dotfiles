#!/usr/bin/env zsh

export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"

if [ -x ~/.linuxbrew ];
then
	export PATH=~/.linuxbrew/bin:$PATH
	export MANPATH=~/.linuxbrew/share/man:$MANPATH
	export INFOPATH=~/.linuxbrew/share/info:$INFOPATH
fi

export EDITOR="vim -e"
export VISUAL=vim


alias update='sudo dnf upgrade; npm update -g; sudo gem update --system; sudo gem update'

alias 1pw=" passcards -v ~/Dropbox/1Password/1Password.agilekeychain"
