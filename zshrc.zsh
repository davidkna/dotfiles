#!/usr/bin/env zsh

export CFLAGS="-march=native -O2 -pipe"
export CXXFLAGS="${CFLAGS}"
export MAKEOPTS="-j5"
export ANDROID_HOME=/usr/local/opt/android-sdk

if [ -f ~/go/bin/antibody ];
then
    source ~/.zsh/antibody.zsh
fi

antibody bundle < "$HOME/.zsh/plugins.txt"

local envfile=~/.zsh/$(uname).zsh
if [ -r $envfile ]; then
    source "$envfile"
fi

export GOPATH=~/go
export PATH=~/bin:~/bin:$PATH

cowsay -f moose "$(fortune)" | lolcat

eval "$(thefuck --alias)"


alias ls="command ls --color"

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
