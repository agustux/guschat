#!/bin/sh
sudo apt update && sudo apt upgrade -y
sudo apt install unattended-upgrades
echo unattended-upgrades unattended-upgrades/enable_auto_updates boolean true | debconf-set-selections
dpkg-reconfigure -f noninteractive unattended-upgrades
echo "APT::Periodic::Update-Package-Lists \"1\";
APT::Periodic::Unattended-Upgrade \"1\";
" >> /etc/apt/apt.conf.d/20auto-upgrades
sudo systemctl restart unattended-upgrades
sudo systemctl enable unattended-upgrades

env SYSTEMD_EDITOR=tee  sudo -E systemctl edit --system apt-daily.timer < .#override.confapt-daily-timer.d
