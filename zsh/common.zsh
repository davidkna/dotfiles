#!/usr/bin/env zsh

export CFLAGS="${CFLAGS} -march=native -O2 -pipe"
export CXXFLAGS="${CXXFLAGS} -march=native -O2 -pipe"
export MAKEOPTS="-j5"
export ANDROID_HOME=/usr/local/opt/android-sdk
export GOPATH=~/go
export PATH=~/bin:$PATH:$GOPATH/bin

# umask 077

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

source ~/.zsh/$(uname).zsh

cowsay -f moose "$(fortune)" | lolcat -
source ~/.zsh/aliases.zsh
