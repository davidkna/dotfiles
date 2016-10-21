#!/usr/bin/env zsh

export CFLAGS="${CFLAGS} -march=native -O2 -pipe"
export CXXFLAGS="${CXXFLAGS} -march=native -O2 -pipe"
export MAKEOPTS="-j5"
export ANDROID_HOME=/usr/local/opt/android-sdk
export GOPATH=~/go
export PATH=~/bin:$PATH:$GOPATH/bin

[[ $- == *i* ]] && cowsay -f moose "$(fortune)" | lolcat -
source ~/.zsh/aliases.zsh

source ~/.zsh/$(uname).zsh
