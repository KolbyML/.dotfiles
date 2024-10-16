#!/bin/bash

dconf dump /org/gnome/shell/extensions/dash-to-panel/ > dash-to-panel.conf
echo "dash-to-panel.conf dumped"
dconf dump /org/gnome/shell/extensions/date-menu-formatter/ > date-menu-formatter.conf
echo "date-menu-formatter.conf dumped"
dconf dump /org/gnome/shell/extensions/blur-my-shell/ > blur-my-shell.conf
echo "blur-my-shell.conf dumped"
