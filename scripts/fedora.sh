#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###
# Repos
###

# RPMFusion
sudo dnf install "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" -y
sudo dnf install "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm" -y
# Yarn
sudo rpm --import https://dl.yarnpkg.com/rpm/pubkey.gpg
sudo wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo
sudo dnf install nodejs nodejs-devel npm yarn -y
# VS Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
# Better Fonts
sudo dnf copr enable dawid/better_fonts
# Extra repos
sudo dnf install fedora-workstation-repositories -y
sudo dnf config-manager --set-enabled google-chrome

###
# Install
###

sudo dnf install cowsay fortune-mod cmake ninja-build vim python3-devel python-devel llvm llvm-libs clang vim htop zsh \
                 langpacks-de thermald ripgrep exa automake gcc gcc-c++ glib-devel dbus-glib-devel libxml2-devel ffmpeg \
                 mpv texlive-scheme-medium texlive-minted texstudio yarn nodejs nodejs-devel npm code syncthing \
                 syncthing-gtk python2-nautilus fontconfig-enhanced-defaults fontconfig-font-replacements google-chrome util-linux-user -y
sudo dnf groupinstall "Development Tools" "C Development Tools and Libraries" -y

# Get zsh plugin installer 
yarn global add zsh-goggles

###
# Services / Settings
###

# Enable and start Syncthing
systemctl enable --user --now syncthing.service

# TRIM
sudo systemctl enable --now fstrim.timer

# Shell
sudo chsh -s $(which zsh) $(whoami)
