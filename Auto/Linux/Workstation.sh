#!/bin/bash

# Atualizando o sistema
sudo dnf update -y && sudo dnf upgrade -y

# Instalando pacotes essenciais
sudo dnf install -y wget curl git vim htop 

# Instalando navegadores
sudo dnf install -y google-chrome-stable

# Instalando aplicativos obrigatórios
sudo dnf install -y code intellij-idea-community virtualbox steam

# Instalando 1Password
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
echo '[1password]
name=1Password
baseurl=https://downloads.1password.com/linux/rpm/stable/$basearch
enabled=1
gpgcheck=1
gpgkey=https://downloads.1password.com/linux/keys/1password.asc' | sudo tee /etc/yum.repos.d/1password.repo
sudo dnf install -y 1password

# Instalando Spotify
sudo dnf install -y lpf-spotify-client

# Instalando Node.js e npm
sudo dnf install -y nodejs

# Instalando Java (OpenJDK 17)
sudo dnf install -y java-17-openjdk-devel

# Instalando drivers NVIDIA
sudo dnf install -y akmod-nvidia xorg-x11-drv-nvidia-cuda

# Configuração de atalhos no GNOME
# Abrir terminal com Alt+X (ptyxis)
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Abrir Terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'ptyxis'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Alt>X'

# Abrir Home Folder com Super+E
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'Abrir Home'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'nautilus'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Super>E'

# Alternar janelas com Alt+Tab (já padrão, mas reforçando)
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Alt>Tab']"

# Configurações do sistema
# Definir tema dark
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# Desativar aceleração do mouse
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'

echo "Setup concluído! Reinicie o sistema para aplicar todas as mudanças."
