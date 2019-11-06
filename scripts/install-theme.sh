#!/bin/bash

# install Arc KDE
add-apt-repository ppa:papirus/papirus
apt-get update
apt-get install --install-recommends arc-kde

# install Breeze Dark - White icons
wget -O breeze-white.tar.gz "https://dllb2.pling.com/api/files/download/id/1537413432/s/a7e5af844871c41170e8d505f04c586fe13d8500d860607f56269b8c39fe7bce43370f9c3a99fc173886184cd44cf8e48c1b68da4beff58e09b24bfa1a086100/t/1573010215/c/f99d2ad5f75a8a49e8c020e3454b39538d7a0cceee262603b62b1bb5af097524a2f18bf17cbc970b0214de35d57a18e418c627e0ec0e3e3f4512eadc5c3a2c5f/lt/download/breeze-white-20180920031712.tar.gz"
tar -xvzf breeze-white.tar.gz -C ~/.local/share/icons
rm ~/.local/share/icons/breeze-white.tar.gz
update-icon-caches ~/.local/share/icons/*
