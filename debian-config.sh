#!/bin/bash

# Prepare System
echo -------------------------
echo | Preparing System      |
echo -------------------------
sudo apt update
# Optional Upgrade
# sudo apt upgrade

# Install mains
echo --------------------------
echo | Installing Environment |
echo --------------------------
sudo apt install -y compton awesome rofi polybar

# Install tools
echo -------------------------
echo | Installing Tools      |
echo -------------------------
sudo apt install -y neofetch neovim python3-pip git wget openssh-server terminator imagemagick
sudo pip3 install pywal colorz

# Programs
echo -------------------------
echo | Installing Programs   |
echo -------------------------
mkdir ~/Documents/setup-temp
wget https://zoom.us/client/latest/zoom_amd64.deb -O ~/Documents/setup-temp/zoom_amd64.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O ~/Documents/setup-temp/google-chrome-stable_current_amd64.deb
sudo dpkg -i ~/Documents/setup-temp/zoom_amd64.deb ~/Documents/setup-temp/google-chrome-stable_current_amd64.deb


# Configuration
echo -------------------------
echo | Configuring           |
echo -------------------------
mkdir ~/Documents/setup-temp/DotFiles
git clone https://github.com/MasterMach50/DotFiles.git ~/Documents/setup-temp/DotFiles
cp -R ~/Documents/setup-temp/DotFiles/Debian/.config/ ~/.config
cp ~/Documents/setup-temp/DotFiles/Debian/.bashrc ~

# Final
echo -------------------------
echo | Finishing Up          |
echo -------------------------
# Optionally remove setup-temp
# sudo rm -rf ~/Documents/setup-temp/DotFiles
# sudo rmdir ~/Documents/setup-temp
sudo chown $USER ~/.config -R
sudo chown $USER ~/.bashrc
sudo chown $USER ~/.gitconfig

# Change mode of scripts
sudo chmod +x ~/.config/polybar/launch.sh
sudo apt --fix-broken install

# Set themes
wal -c
wal -i ~/.config/common-res/train_bridge.jpg
python3 ~/.config/user-scripts/colour_finder.pyw

# Optional Autoremove
# sudo apt autoremove
