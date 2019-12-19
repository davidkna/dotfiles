#!/usr/bin/env pwsh

$env:Path+="$HOME/bin"
$env:Path+="$HOME/.local/bin"
$env:Path+="$HOME/.cargo/bin"

$ENV:EDITOR="nvim"
$ENV:VISUAL="code --wait"

$ENV:CFLAGS="${CFLAGS} -march=native -O2 -pipe"
$ENV:CXXFLAGS="${CXXFLAGS} -march=native -O2 -pipe"
$ENV:RUSTFLAGS="-Ctarget-cpu=native"

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
$ENV:PYTHONIOENCODING='UTF-8';

# Omit duplicates and commands that begin with a space from history.
$ENV:HISTCONTROL='ignoreboth';

$ENV:LANG='de_DE.UTF-8';
$ENV:LC_ALL='de_DE.UTF-8';

Import-Module PSReadLine
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

&~/.cargo/bin/neo-fortune cowsay -f moose -l
Invoke-Expression (&starship init powershell)