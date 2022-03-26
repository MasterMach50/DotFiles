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
sudo mkdir /home/mathew/Documents/setup-temp
sudo wget https://zoom.us/client/latest/zoom_amd64.deb -O /home/mathew/Documents/setup-temp/zoom_amd64.deb
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /home/mathew/Documents/setup-temp/google-chrome-stable_current_amd64.deb
sudo dpkg -i /home/mathew/Documents/setup-temp/zoom_amd64.deb /home/mathew/Documents/setup-temp/google-chrome-stable_current_amd64.deb


#configuration
echo =========================
echo Configuring 
echo =========================
sudo mkdir /home/mathew/Documents/setup-temp/DotFiles
sudo git clone https://github.com/MasterMach50/DotFiles.git /home/mathew/Documents/setup-temp/DotFiles
sudo cp -r /home/mathew/Documents/setup-temp/DotFiles/Ubuntu/.config/. /home/mathew/.config
sudo cp /home/mathew/Documents/setup-temp/DotFiles/Ubuntu/.bashrc /home/mathew

#final
echo =========================
echo Finishing Up
echo =========================
sudo rm -rf /home/mathew/Documents/setup-temp/DotFiles
sudo rmdir /home/mathew/Documents/setup-temp
sudo chown mathew /home/mathew/.config -R
sudo chown mathew /home/mathew/.bashrc
sudo chown mathew /home/mathew/.gitconfig

#change mode of scripts
sudo chmod +x /home/mathew/.config/polybar/launch.sh

sudo apt --fix-broken install

sudo apt autoremove
