#!/usr/bin/env zsh
export PATH=~/.local/bin:$PATH:~/.cargo/bin:~/.yarn/bin
export EDITOR=vim
export VISUAL="code --wait"

export CFLAGS="${CFLAGS} -march=native -O2 -pipe"
export CXXFLAGS="${CXXFLAGS} -march=native -O2 -pipe"
export RUSTFLAGS="-Ctarget-cpu=native"
export MAKEOPTS="-j5"

export NODE_REPL_HISTORY=~/.node_history;
export NODE_REPL_MODE='sloppy';
# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

export LANG='de_DE.UTF-8';
export LC_ALL='de_DE.UTF-8';
# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

source ~/.zsh/$(uname).zsh

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

cowsay -f moose "$(fortune)" | lolcat -A
source ~/.zsh/aliases.zsh
source ~/.cargo/env
