#!/usr/bin/env zsh

export CFLAGS="${CFLAGS} -march=native -O2 -pipe"
export CXXFLAGS="${CXXFLAGS} -march=native -O2 -pipe"
export MAKEOPTS="-j5"
export ANDROID_HOME=/usr/local/opt/android-sdk

if [ -f ~/.zsh/plugins.zsh ];
then
    source ~/.zsh/plugins.zsh
fi

source "${HOME}/.zsh/aliases.zsh"

local envfile=~/.zsh/$(uname).zsh
if [ -r $envfile ]; then
    source "$envfile"
fi

export GOPATH=~/go
export PATH=~/bin:~/bin:$PATH

cowsay -f moose "$(fortune)" | lolcat

if [ -f ~/.nvm/nvm.sh ];
then
   source ~/.nvm/nvm.sh
   nvm use default > /dev/null
fi

# Command completion
autoload -U compinit
compinit

# Case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
