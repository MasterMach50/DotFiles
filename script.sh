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
sudo apt install compton awesome rofi polybar

#install tools
echo =========================
echo Installing Tools
echo =========================
sudo apt install neofetch neovim python3-pip git wget
sudo pip3 install pywal colorz

#programs
echo =========================
echo Installing Programs
echo =========================
mkdir ~/Documents/setup-temp
wget https://zoom.us/client/latest/zoom_amd64.deb -O ~/Documents/setup-temp/zoom_amd64.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O ~/Documents/setup-temp/google-chrome-stable_current_amd64.deb
dpkg -i ~/Documents/setup-temp/zoom_amd64.deb ~/Documents/setup-temp/google-chrome-stable_current_amd64.deb

#configuration
echo =========================
echo Configuring 
echo =========================
mkdir ~/Documents/setup-temp/DotFiles
git clone https://github.com/MasterMach50/DotFiles.git ~/Documents/setup-temp/DotFiles
cp -r ~/Documents/setup-temp/DotFiles/. ~/.config

#final
echo =========================
echo Finishing Up
echo =========================
sudo apt autoremove
