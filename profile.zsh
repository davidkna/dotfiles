export PATH=~/bin:~/.local/bin:"$PATH"
export EDITOR=nvim
export VISUAL="code --wait"

export CFLAGS="${CFLAGS} -march=native -O2 -pipe"
export CXXFLAGS="${CXXFLAGS} -march=native -O2 -pipe"
export RUSTFLAGS="-Ctarget-cpu=native"

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

export LANG='de_DE.UTF-8';
export LC_ALL='de_DE.UTF-8';

alias ls="exa"
alias l="exa -l"
alias ll="exa -l"
alias la="exa -la"
alias tree="exa --tree"

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

if [ -f ~/.cargo/env ]; then
  source ~/.cargo/env
fi


if [ -f ~/.local/share/zsh-goggles/plugins.zsh ];
then
    source ~/.local/share/zsh-goggles/plugins.zsh
fi

# Command completion
autoload -U compinit
compinit

# Case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


~/.cargo/bin/neo-fortune cowsay -f moose -l
eval "$(starship init zsh)"
