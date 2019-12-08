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
sudo dnf config-manager --set-enabled fedora-cisco-openh264
# RPMFusion
sudo dnf install "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" -y
sudo dnf install "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm" -y
# VS Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
# Flathub
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

###
# Install
###

# DNF packages
sudo dnf install cmake ninja-build vim python3-devel python-devel llvm llvm-libs clang htop zsh \
                 langpacks-de ripgrep exa automake gcc gcc-c++ glib-devel dbus-glib-devel libxml2-devel ffmpeg \
                 texlive-scheme-tetex nodejs nodejs-devel npm code syncthing mpv \
                 google-chrome-stable util-linux-user langpacks-ja calibre mozilla-openh264 -y

# DNF groups
sudo dnf groupinstall "Development Tools" "C Development Tools and Libraries" -y

# Flatpaks
sudo flatpak install -y flathub net.ankiweb.Anki
sudo flatpak install -y flathub com.discordapp.Discord
sudo flatpak install -y flathub com.skype.Client
sudo flatpak install -y flathub com.slack.Slack

# Node
npx zsh-goggles

# Rust utils
source ~/.cargo/env
export RUSTFLAGS="-Ctarget-cpu=native"
git clone http://github.com/davidkna/fortune-rs ~/Quellen/fortune-rs
cargo install --path="$HOME/Quellen/fortune-rs"
~/.cargo/bin/neo-fortune download
cargo install starship
cargo install cargo-update

###
# Services / Settings
###

# Enable and start Syncthing
systemctl enable --user --now syncthing.service

# TRIM
sudo systemctl enable --now fstrim.timer

# Shell
sudo chsh -s $(which zsh) $(whoami)
