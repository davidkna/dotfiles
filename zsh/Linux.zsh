export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"

if [ -x "$HOME/.linuxbrew" ];
then
	export PATH="$HOME/.linuxbrew/bin:$PATH"
	export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
	export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
fi

alias update-system=" yaourt -Syua"
alias 1pw=" passcards -v ~/Dropbox/1Password/1Password.agilekeychain"
alias subl=subl3
