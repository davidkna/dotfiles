#!/usr/bin/env zsh

source ~/.zsh/common.zsh

if [ -f ~/.zsh/plugins.zsh ];
then
    source ~/.zsh/plugins.zsh
fi

# Command completion
autoload -U compinit
compinit

# Case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
