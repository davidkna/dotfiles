#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macOS` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###
# Install stuff
###
sudo dnf install cowsay fortune-mod ruby cmake ninja-build vim python3-devel python-devel llvm llvm-libs clang boost-devel boost-python3-devel vim htop zsh libreoffice-langpack-de
sudo dnf groupinstall "Development Tools" "C Development Tools and Libraries" -y
sudo dnf install automake gcc gcc-c++ glib-devel dbus-glib-devel libxml2-devel -y

gem install lolcat
chsh -s /usr/bin/zsh

# TRIM
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer

# dnsmasq
sudo ruby ~/.dotfiles/Fedora/dnsmasq.rb
sudo cp ~/.dotfiles/Fedora/common/dnsmasq.conf /etc/NetworkManager/dnsmasq.d/unotelly.conf

# lz4
echo compress="lz4" | sudo tee /etc/dracut.conf.d/lz4.conf
sudo dracut -f

###
# Vim
###
echo "" | vim -c ":PlugInstall"

###
# RPMfusion
###

# Add repos
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Install stuff
sudo dnf install gstreamer1-plugins-* ffmpeg mpv dropbox steam

###
# Google Chrome
###
sudo rpm --import https://dl-ssl.google.com/linux/linux_signing_key.pub
sudo dnf -y install https://dl.google.com/linux/direct/google-chrome-stable_current_$(uname -i).rpm

###
# TeX stuff
###
sudo dnf install texlive-scheme-most texlive-minted texstudio -y

###
# Node.js
###

# Get Node 6
curl -sL https://rpm.nodesource.com/setup_6.x | bash -
sudo dnf install nodejs -y

# Get zsh plugins
sudo npm i -g zsh-goggles
zsh-goggles

###
# Syncthing
###

# Enable copr
sudo dnf copr enable decathorpe/syncthing -y

# Install Syncthing
sudo dnf install -y syncthing syncthing-gtk python-nautilus

# Enable and start Syncthing
systemctl --user enable syncthing.service
systemctl --user start syncthing.service

###
# Thermald
###

cd ~/Quellen
git clone https://github.com/01org/thermal_daemon.git thermald
cd thermald
./autogen.sh
./configure prefix=/usr
make
sudo make install
sudo systemctl enable thermald
