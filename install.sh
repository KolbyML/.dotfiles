#!/bin/bash

# Install Segoe UI font (Font from Windows)
git clone https://github.com/mrbvrz/segoe-ui-linux
cd segoe-ui-linux
chmod +x install.sh
./install.sh
cd ..
rm -rf segoe-ui-linux

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install wallpaper to windows 10
sudo cp wallpapers/windows10.jpg /usr/share/backgrounds/windows10.jpg
gsettings set org.gnome.desktop.background picture-uri-dark "file:///usr/share/backgrounds/windows10.jpg"

# Install Windows Cursor as default cursor
sudo cp .icons/Windows10Light/ /usr/share/icons -r

# Set Windows10Light as default cursor for it to work on discord
gsettings set org.gnome.desktop.interface cursor-theme "Windows10Light"
sudo cp /usr/share/icons/default/index.theme /usr/share/icons/default/index.theme.bak
sudo sed -i '/^\[Icon Theme\]$/,/^\[/{s/Inherits=.*/Inherits=Windows10Light/}' /usr/share/icons/default/index.theme

# Install Flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install Gearlever (A Manager for AppImage)
flatpak install flathub it.mijorus.gearlever

# Install Vencord (Discord alternative)
flatpak install flathub dev.vencord.Vesktop

# Install Github Desktop
flatpak install flathub io.github.shiftey.Desktop

# Install Brave
flatpak install flathub com.brave.Browser

# Install Podman Desktop (Docker Desktop alternative)
flatpak install flathub io.podman_desktop.PodmanDesktop

# Install Visual Studio Code
flatpak install flathub com.visualstudio.code

# Install VLC
flatpak install flathub org.videolan.VLC

# Install qBittorrent
flatpak install flathub org.qbittorrent.qBittorrent

# Install Flatseal
flatpak install com.github.tchx84.Flatseal

# Install Element
flatpak install flathub im.riot.Riot

# Install Steam
flatpak install com.valvesoftware.Steam

# Install Zoom
flatpak install flathub us.zoom.Zoom

# Install Gnome Extensions
flatpak install flathub org.gnome.Extensions

# Install anki
./bash_installs/anki.sh

# Install Resources
flatpak install flathub net.nokyan.Resources

# Install Hidamari (video wallpapers)
flatpak install flathub io.github.jeffshee.Hidamari

echo "You might want to install the following manually:"
echo "1. Mozc (Japanese Keyboard)"
echo "2. Neofetch"
echo "3. htop"
echo "4. Gnome Tweaks"
