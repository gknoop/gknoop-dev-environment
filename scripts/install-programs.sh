#!/bin/bash

# make directory for install files, then move there
mkdir ~/Downloads/gde && cd ~/Downloads/gde

# Bat
# repo not available for (k)Ubuntu 18. need to set up automated command-based install for asset file from latest release.

# Caffeine
apt install caffeine -y

# Calibre
apt install calibre -y

# Discord
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
dpkg -i ./discord.deb
apt-get install -fy

# Firefox Dev Edition
# need to check "if" Firefox is installed, then remove
# apt remove firefox
wget -O firefox-dev-edition.tar.bz2 "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US"
tar -xvjf firefox-dev-edition.tar.bz2 -C /opt/
mv firefox firefox-dev-edition

# Latte Dock
apt install latte-dock -y

# Neofetch
apt install neofetch -y

# Nextcloud
add-apt-repository ppa:nextcloud-devs/client
apt update
apt install nextcloud-client -y

# Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
apt install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
apt update
apt install sublime-text -y

# move up a level and delete install files
cd .. && rm -rf gde/
