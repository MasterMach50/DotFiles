#!/bin/bash

#preare system
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
sudo apt install neofetch neovim python3-pip

#final
echo =========================
echo Finishing Up
echo =========================
sudo apt autoremove
