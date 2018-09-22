#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###
# Repos
###

# Extra repos
sudo dnf install fedora-workstation-repositories -y
sudo dnf config-manager --set-enabled google-chrome
# RPMFusion
sudo dnf install "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" -y
sudo dnf install "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm" -y
# Yarn
sudo rpm --import https://dl.yarnpkg.com/rpm/pubkey.gpg
sudo wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo
# VS Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
# Flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

###
# Install
###

# DNF packages
sudo dnf install cowsay fortune-mod cmake ninja-build vim python3-devel python-devel llvm llvm-libs clang htop zsh \
                 langpacks-de ripgrep exa automake gcc gcc-c++ glib-devel dbus-glib-devel libxml2-devel ffmpeg \
                 texlive-scheme-medium yarn nodejs nodejs-devel npm code syncthing syncthing-gtk mpv \
                 python2-nautilus google-chrome util-linux-user gnome-builder -y

# DNF groups
sudo dnf groupinstall "Development Tools" "C Development Tools and Libraries" -y

# Flatpaks
flatpak install flathub net.ankiweb.Anki
flatpak install flathub com.calibre_ebook.calibre
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.skype.Client
flatpak install flathub com.slack.Slack
flatpak install flathub org.mozilla.Thunderbird

# Node
yarn global add zsh-goggles

# Rust
rustup default nightly
cd ~/Quellen
git clone http://github.com/davidkna/lolcat-rs lolcat-rs
cd ~/Quellen/lolcat-rs
cargo +nightly install --path=.

###
# Services / Settings
###

# Enable and start Syncthing
systemctl enable --user --now syncthing.service

# TRIM
sudo systemctl enable --now fstrim.timer

# Shell
~/.yarn/bin/zgoggles
sudo chsh -s $(which zsh) $(whoami)
