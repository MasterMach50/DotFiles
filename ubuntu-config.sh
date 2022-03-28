#!/bin/bash

#prepare system
echo =========================
echo Preparing System
echo =========================
sudo apt update
sudo upgrade

#install mains
echo =========================
echo Installing Environment
echo =========================
sudo apt install -y compton awesome rofi polybar

#install tools
echo =========================
echo Installing Tools
echo =========================
sudo apt install -y neofetch neovim python3-pip git wget openssh-server terminator imagemagick
sudo pip3 install pywal colorz

#programs
echo =========================
echo Installing Programs
echo =========================
sudo mkdir ~/Documents/setup-temp
sudo wget https://zoom.us/client/latest/zoom_amd64.deb -O ~/Documents/setup-temp/zoom_amd64.deb
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O ~/Documents/setup-temp/google-chrome-stable_current_amd64.deb
sudo dpkg -i ~/Documents/setup-temp/zoom_amd64.deb ~/Documents/setup-temp/google-chrome-stable_current_amd64.deb


#configuration
echo =========================
echo Configuring 
echo =========================
sudo mkdir ~/Documents/setup-temp/DotFiles
sudo git clone https://github.com/MasterMach50/DotFiles.git ~/Documents/setup-temp/DotFiles
sudo cp -r ~/Documents/setup-temp/DotFiles/Ubuntu/.config/. ~/.config
sudo cp ~/Documents/setup-temp/DotFiles/Ubuntu/.bashrc ~

#final
echo =========================
echo Finishing Up
echo =========================
sudo rm -rf ~/Documents/setup-temp/DotFiles
sudo rmdir ~/Documents/setup-temp
sudo chown mathew ~/.config -R
sudo chown mathew ~/.bashrc
sudo chown mathew ~/.gitconfig

#change mode of scripts
sudo chmod +x ~/.config/polybar/launch.sh
sudo apt --fix-broken install

#set themes
wal -c
wal -i ~/.config/awesome/res/backgrounds/snowy_evergreen_mountains.jpg
python3 ~/.config/polybar/colour_finder.pyw
~/.config/polybar/launch.sh

sudo apt autoremove
