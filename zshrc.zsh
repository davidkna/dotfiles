export CFLAGS="-march=native -O2 -pipe"
export CXXFLAGS="${CFLAGS}"
export MAKEOPTS="-j4"
export ANDROID_HOME=/usr/local/opt/android-sdk

source "$HOME/.zsh/antibody.zsh"

antibody bundle < "$HOME/.zsh/plugins.txt"

envfile="$HOME/.zsh/$(uname).zsh"
if [ -r $envfile ]; then
    source "$envfile"
fi

export GOPATH=$HOME/go
export PATH="$HOME/bin:$GOPATH/bin:$PATH"

cowsay -f moose "$(fortune)" | lolcat

eval "$(thefuck --alias)"

if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi
alias ls="command ls ${colorflag}"

if [ -f "$HOME/.nvm/nvm.sh" ];
then
   source "$HOME/.nvm/nvm.sh"
   nvm use default > /dev/null
fi

# Command completion
autoload -U compinit
compinit

# Case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
