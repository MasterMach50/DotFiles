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
sudo apt install -y neofetch neovim python3-pip git wget openssh-server terminator
sudo pip3 install pywal colorz

#programs
echo =========================
echo Installing Programs
echo =========================
sudo mkdir /home/$USER/Documents/setup-temp
sudo wget https://zoom.us/client/latest/zoom_amd64.deb -O /home/$USER/Documents/setup-temp/zoom_amd64.deb
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /home/$USER/Documents/setup-temp/google-chrome-stable_current_amd64.deb
sudo dpkg -i /home/$USER/Documents/setup-temp/zoom_amd64.deb /home/$USER/Documents/setup-temp/google-chrome-stable_current_amd64.deb


#configuration
echo =========================
echo Configuring 
echo =========================
sudo mkdir /home/$USER/Documents/setup-temp/DotFiles
sudo git clone https://github.com/MasterMach50/DotFiles.git /home/$USER/Documents/setup-temp/DotFiles
sudo cp -r /home/$USER/Documents/setup-temp/DotFiles/Ubuntu/.config/. /home/$USER/.config
sudo cp /home/$USER/Documents/setup-temp/DotFiles/Ubuntu/.bashrc /home/$USER

#final
echo =========================
echo Finishing Up
echo =========================
sudo rm -rf /home/$USER/Documents/setup-temp/DotFiles
sudo rmdir /home/$USER/Documents/setup-temp
sudo chown $USER /home/$USER/.config -R
sudo chown $USER /home/$USER/.bashrc
sudo chown $USER /home/$USER/.gitconfig

#change mode of scripts
sudo chmod +x /home/$USER/.config/polybar/launch.sh

sudo apt autoremove
