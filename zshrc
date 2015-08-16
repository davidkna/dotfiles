
export PATH="$HOME/bin:$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

export GOPATH=$HOME/go

source ~/.zsh/antigen-hs/init.zsh

fortune -s | cowsay

eval "$(thefuck-alias)"

source "$HOME/.nvm/nvm.sh"
nvm use default > /dev/null
