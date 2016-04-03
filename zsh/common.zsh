#!/usr/bin/env zsh

export CFLAGS="${CFLAGS} -march=native -O2 -pipe"
export CXXFLAGS="${CXXFLAGS} -march=native -O2 -pipe"
export MAKEOPTS="-j5"
export ANDROID_HOME=/usr/local/opt/android-sdk
export GOPATH=~/go
export PATH=~/bin:$PATH:$GOPATH/bin

cowsay -f moose "$(fortune)" | lolcat
source ~/.zsh/aliases.zsh

envfile=$(uname).zsh
if [ -r $envfile ]; then
    source ~/.zsh/$envfile
fi
