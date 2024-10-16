#!/bin/bash

dconf load /org/gnome/shell/extensions/dash-to-panel/ < dash-to-panel.conf
echo "dash-to-panel.conf loaded"
dconf load /org/gnome/shell/extensions/date-menu-formatter/ < date-menu-formatter.conf
echo "date-menu-formatter.conf loaded"
dconf load /org/gnome/shell/extensions/blur-my-shell/ < blur-my-shell.conf
echo "blur-my-shell.conf loaded"
dconf load /org/gnome/shell/extensions/tiling-assistant/ < tiling-assistant.conf
echo "tiling-assistant.conf loaded"