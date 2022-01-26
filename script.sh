#!/bin/bash

#prepare system
echo \n=========================
echo Preparing System
echo =========================\n
sudo apt update
sudo upgrade

#install mains
echo \n=========================
echo Installing Environment
echo =========================\n
sudo apt install -y compton awesome rofi polybar

#install tools
echo \n=========================
echo Installing Tools
echo =========================\n
sudo apt install -y neofetch neovim python3-pip git wget
sudo pip3 install pywal colorz

#programs
echo \n=========================
echo Installing Programs
echo =========================\n
sudo mkdir ~/Documents/setup-temp
sudo wget https://zoom.us/client/latest/zoom_amd64.deb -O ~/Documents/setup-temp/zoom_amd64.deb
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O ~/Documents/setup-temp/google-chrome-stable_current_amd64.deb
sudo dpkg -i ~/Documents/setup-temp/zoom_amd64.deb ~/Documents/setup-temp/google-chrome-stable_current_amd64.deb


#configuration
echo \n=========================
echo Configuring 
echo =========================\n
sudo mkdir ~/Documents/setup-temp/DotFiles
sudo git clone https://github.com/MasterMach50/DotFiles.git ~/Documents/setup-temp/DotFiles
sudo cp -r ~/Documents/setup-temp/DotFiles/. ~/.config

#final
echo \n=========================
echo Finishing Up
echo =========================\n
sudo rm -rf ~/Documents/setup-temp/DotFiles
sudo apt autoremove
