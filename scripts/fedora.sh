#!/usr/bin/env bash

set -eux

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###
# Repos
###

sudo dnf install -y \
    fedora-workstation-repositories \
    "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
    "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

sudo dnf config-manager --set-enabled google-chrome
sudo dnf config-manager --set-enabled fedora-cisco-openh264

# VS Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | \
    sudo tee /etc/yum.repos.d/vscode.repo
# Flathub
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

###
# Install
###

# DNF packages
sudo dnf install -y \
    cmake ninja-build llvm llvm-libs clang automake gcc gcc-c++ \
    python3-devel nodejs-devel nodejs npm texlive-scheme-tetex \
    black pylint poetry python3-notebook mathjax sscg pandoc pandoc-pdf \
    google-chrome-stable code neovim mpv calibre \
    langpacks-de langpacks-ja mozilla-openh26 iwd wireguard \
    ffmpeg tokei bsdtar util-linux-user htop podman \
    zsh fish starship exa

# DNF groups
sudo dnf groupinstall "Development Tools" "C Development Tools and Libraries" -y

# Flatpaks
sudo flatpak install -y flathub com.bitwarden.desktop
sudo flatpak install -y flathub com.discordapp.Discord

# Node
npx zsh-goggles

# Rust utils
source ~/.cargo/env
export RUSTFLAGS="-Ctarget-cpu=native"
git clone http://github.com/davidkna/fortune-rs ~/Quellen/fortune-rs
cargo install --path="$HOME/Quellen/fortune-rs"
~/.cargo/bin/neo-fortune download
cargo install cargo-update

###
# Services / Settings
###

# System Services
sudo systemctl enable --now fstrim.timer
sudo systemctl enable iwd
echo -e '[device]\nwifi.backend=iwd' | \
    sudo tee /etc/NetworkManager/conf.d/iwd.conf

# User Services
systemctl enable --user --now syncthing.service

# Shell
sudo chsh -s $(which zsh) $(whoami)

# HiDPI
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
