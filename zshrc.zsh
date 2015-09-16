envfile="$HOME/.zsh/$(uname).zsh"
if [ -r $envfile ]; then
    source "$envfile"
fi

export PATH="$HOME/bin:$PATH"

export GOPATH=$HOME/go

source "$HOME/.zsh/antibody/antibody.zsh"

antibody bundle < "$HOME/.zsh/plugins.txt"

cowsay $(fortune) | lolcat

eval "$(thefuck --alias)"

if [ -f "$HOME/.nvm/nvm.sh" ];
then
   source "$HOME/.nvm/nvm.sh"
	nvm use default > /dev/null
fi

export EDITOR=nano
export VISUAL=subl
