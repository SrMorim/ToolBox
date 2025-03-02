#!/bin/bash
# workstation.sh - Script para configurar o Fedora para um ambiente fullstack/ciência da computação

# Atualiza o sistema
sudo dnf update -y

#######################
# Instalação de Dependências
#######################
# Dependências para o VirtualBox e Flatpak
sudo dnf install -y kernel-devel kernel-headers dkms flatpak

#######################
# Instalação de Repositórios e Aplicativos
#######################

# 1. Google Chrome:
sudo tee /etc/yum.repos.d/google-chrome.repo > /dev/null <<EOF
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF
sudo dnf install -y google-chrome-stable

# 2. 1Password:
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo tee /etc/yum.repos.d/1password.repo > /dev/null <<EOF
[1password]
name=1Password Stable Channel
baseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch
enabled=1
gpgcheck=1
EOF
sudo dnf install -y 1password

# 3. Spotify:
sudo tee /etc/yum.repos.d/spotify.repo > /dev/null <<EOF
[spotify]
name=Spotify Repository
baseurl=http://negativo17.org/repos/spotify-f24/\$basearch
enabled=1
gpgcheck=1
gpgkey=http://negativo17.org/repos/spotify-f24/repodata/repomd.xml.key
EOF
sudo dnf install -y spotify-client

# 4. VSCode:
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo tee /etc/yum.repos.d/vscode.repo > /dev/null <<EOF
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF
sudo dnf install -y code

# 5. IntelliJ IDEA Ultimate:
# Instala o snapd e depois o IntelliJ via snap
sudo dnf install snapd -y
sudo ln -s /var/lib/snapd/snap /snap 2>/dev/null
sudo snap install intellij-idea-ultimate --classic

# 6. VirtualBox:
sudo dnf install -y VirtualBox

# 7. Steam:
sudo dnf install -y steam

# 8. btop:
sudo dnf install -y btop

# 9. MySQL Workbench:
sudo dnf install -y mysql-workbench

# 10. Node.js:
sudo dnf install -y nodejs

# 11. Postman:
sudo snap install postman

# 12. Obsidian:
flatpak install flathub md.obsidian.Obsidian -y

#######################
# Instalação do JDK
#######################
# Instala o OpenJDK 11 (ou altere para a versão desejada, como java-17-openjdk-devel)
sudo dnf install -y java-11-openjdk-devel

#######################
# Configuração de Atalhos e Personalizações GNOME
#######################

# 1. Atalho para abrir o terminal (ptyxis) com Alt+x
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal/']"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal/name "'Terminal'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal/command "'ptyxis'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal/binding "'<Alt>x>'"

# 2. Atalho para abrir a Home Folder com Super+e
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/home-folder/']"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/home-folder/name "'Home Folder'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/home-folder/command "'xdg-open ~'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/home-folder/binding "'<Super>e'"

# 3. Atalho para switch windows com Alt+Tab (alterna janelas individualmente)
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
# Desabilita o comportamento padrão de switch applications
gsettings set org.gnome.desktop.wm.keybindings switch-applications "[]"

# 4. Define o tema dark (usando Adwaita-dark)
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

# 5. Desabilita a aceleração do mouse
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'

echo "Configuração da Workstation concluída! Reinicie sua sessão para que todas as alterações tenham efeito."
