#!/bin/bash

# SYSTEM SETTINGS
# Adicionar o atalho para abrir o terminal (ptyxis) com Alt+x
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Terminal Ptyxis'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'ptyxis --new-window'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Alt>X'

# Adicionar o atalho para abrir a Home Folder com Super+e
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'Abrir Home'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'nautilus --new-window'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Super>e'

# Atalho para switch windows com Alt+Tab (alterna janelas individualmente)
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"

# Desabilita o comportamento padrão de switch applications
gsettings set org.gnome.desktop.wm.keybindings switch-applications "[]"

# Define o tema dark (usando Adwaita-dark)
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# Desabilita a aceleração do mouse
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'

# Desativar Screen Blanck e Automatic suspend
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'

# APPS
# Dev:
# MySQL Server
sudo dnf install community-mysql-server
sudo systemctl enable mysqld
sudo systemctl start mysqld
sudo mysql_secure_installation

# Intellij IDEA
sudo flatpak install flathub com.jetbrains.IntelliJ-IDEA-Ultimate -y

# DataGrip
sudo flatpak install flathub com.jetbrains.DataGrip -y

# VSCode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install -y code # or code-insiders

# Node.js
sudo dnf install -y nodejs

# MANAGEMENT
# Spotify
sudo flatpak install flathub com.spotify.Client -y

# Obsidian
sudo flatpak install flathub md.obsidian.Obsidian -y

# Steam
sudo dnf install -y steam

# btop
sudo dnf install -y btop

# Google Chrome
sudo dnf install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

# 1Password
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
sudo dnf install -y 1password
