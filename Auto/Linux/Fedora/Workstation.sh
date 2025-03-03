#!/bin/bash

# Atualizando o sistema
sudo dnf update -y && sudo dnf upgrade -y

# Dependences # 
sudo dnf install -y make time perl gcc kernel-devel kernel-headers dkms flatpak snapd java-11-openjdk-devel
sudo systemctl enable --now snapd
sudo ls -s /var/lib/snapd/snap /snap

# Apps #
# 1. Google Chrome:
sudo dnf install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

# 2. Intellij Idea:
sudo snap install intellij-idea-ultimate --classic

# 3. 1Password:
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
sudo dnf install -y 1password

# 4. VSCode:
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install -y code # or code-insiders

# 5. VirtualBox:
sudo dnf install -y VirtualBox

# 6. Steam:
sudo dnf install -y steam

# 7. btop:
sudo dnf install -y btop

# 8. MySQL Workbench:
sudo dnf install -y mysql-workbench

# 9. Node.js:
sudo dnf install -y nodejs

# 10. Postman:
sudo snap install -y postman

# 11. Obsidian:
flatpak install flathub md.obsidian.Obsidian -y

# 12. btop:
sudo dnf install -y btop

# 13. Spotify
sudo snap install spotify

echo "Workstation Configurada! Reinicie sua sessão para que todas as alterações tenham efeito."