#!/usr/bin/env zsh

export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"

# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
	if [ $# -eq 0 ]; then
		gnome-open .;
	else
		gnome-open "$@";
	fi;
}

alias update='sudo dnf upgrade -y; sudo npm update -g; sudo gem update --system; gem update'
