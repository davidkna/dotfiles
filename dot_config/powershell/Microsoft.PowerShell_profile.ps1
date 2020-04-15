#!/usr/bin/env pwsh

$ENV:Path += ":~/bin:~/.local/bin:~/.cargo/bin"
$ENV:EDITOR="nvim"
$ENV:VISUAL="code --wait"

$ENV:CFLAGS="${CFLAGS} -march=native -O2 -pipe"
$ENV:CXXFLAGS="${CXXFLAGS} -march=native -O2 -pipe"
$ENV:RUSTFLAGS="-Ctarget-cpu=native"

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
$ENV:PYTHONIOENCODING='UTF-8'

$ENV:LANG='de_DE.UTF-8'
$ENV:LC_ALL='de_DE.UTF-8'
$ENV:LC_TIME='ja_JP.UTF-8'

Import-Module PSReadLine
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

&neo-fortune cowsay -f moose -l
&starship init powershell --print-full-init | Out-String | Invoke-Expression