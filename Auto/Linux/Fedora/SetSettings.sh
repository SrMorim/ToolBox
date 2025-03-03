# System #
# Atalho para abrir o terminal (ptyxis) com Alt+x
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Terminal Ptyxis'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'ptyxis'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Alt>X'

# Atalho para abrir a Home Folder com Super+e
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'Abrir Home'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'nautilus ~'
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



# Criar Pastas de Trabalho
mkdir -p "$(xdg-user-dir DOCUMENTS)/GitHub"
mkdir -p "$(xdg-user-dir DOCUMENTS)/VMs"
