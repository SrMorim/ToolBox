#!/bin/bash

# Atualizando o sistema
sudo dnf update -y && sudo dnf upgrade -y

# Instalando pacotes essenciais
sudo dnf install -y wget curl git vim htop btop preload

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
sudo dnf install -y java-17-openjdk-devel maven gradle

# Instalando JProfiler
wget -O jprofiler.rpm https://download-gcdn.ej-technologies.com/jprofiler/jprofiler_linux_amd64.rpm
sudo dnf install -y ./jprofiler.rpm
rm -f jprofiler.rpm

# Instalando MySQL
sudo dnf install -y mysql-server mysql-workbench
sudo systemctl enable --now mysqld

# Instalando Docker e Docker Compose
sudo dnf install -y docker docker-compose
sudo systemctl enable --now docker
sudo usermod -aG docker $USER

# Instalando Postman
wget -O postman.tar.gz https://dl.pstmn.io/download/latest/linux64
sudo tar -xzf postman.tar.gz -C /opt
rm -f postman.tar.gz
sudo ln -s /opt/Postman/Postman /usr/local/bin/postman

# Instalando drivers NVIDIA e ativando modo performance
sudo dnf install -y akmod-nvidia xorg-x11-drv-nvidia-cuda
sudo nvidia-settings -a '[gpu:0]/GPUPowerMizerMode=1'

# Configuração de Sysctl Tweaks
sudo tee /etc/sysctl.d/99-custom.conf > /dev/null <<EOL
vm.swappiness=10
vm.dirty_ratio=20
vm.dirty_background_ratio=10
fs.inotify.max_user_watches=524288
EOL
sudo sysctl --system

# Configuração de HugePages para otimizar performance
sudo tee /etc/default/grub.d/hugepages.cfg > /dev/null <<EOL
GRUB_CMDLINE_LINUX_DEFAULT="$GRUB_CMDLINE_LINUX_DEFAULT hugepagesz=2M default_hugepagesz=2M hugepages=512"
EOL
sudo grub2-mkconfig -o /boot/grub2/grub.cfg

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