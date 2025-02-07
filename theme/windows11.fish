# Install necessary packages
sudo apt update
sudo apt install gnome-tweaks gnome-shell-extensions gnome-shell-extension-prefs

# Install Win11 icon theme
https://github.com/yeyushengfan258/Win11-icon-theme
cd Win11-icon-theme
./install.sh
cd ..

# Install Fluent GTK theme
https://github.com/vinceliuice/Fluent-gtk-theme
cd Fluent-gtk-theme
./install.sh
cd ..

# Install Segoe UI font
https://github.com/mrbvrz/segoe-ui-linux
cd segoe-ui-linux
./install.sh
cd ..

# Download and set wallpaper
curl -O https://www.mediafire.com/view/ct0qkuhl5m32x26/image-199-removebg-preview.png/file
gsettings set org.gnome.desktop.background picture-uri file:///$PWD/image-199-removebg-preview.png

# Enable user themes extension
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com

# Set the GTK theme and icon theme
gsettings set org.gnome.desktop.interface gtk-theme "Fluent"
gsettings set org.gnome.desktop.interface icon-theme "Win11-icon-theme"

# Set the shell theme
gsettings set org.gnome.shell.extensions.user-theme name "Fluent"

# Install Windows 11 cursor theme
git clone https://github.com/ful1e5/Windows-11-Cursors
cd Windows-11-Cursors
./install.sh
cd ..

# Set the cursor theme
gsettings set org.gnome.desktop.interface cursor-theme "Windows-11-Cursors"

# Configure the dock to look like Windows 11
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 48
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode 'FIXED'
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.6

# Prompt user to revert to default Ubuntu theme or keep Windows 11 theme
read -p "Do you want to revert to the default Ubuntu theme? (y/n): " revert_theme

if [ "$revert_theme" = "y" ]; then
    # Revert to default Ubuntu theme
    gsettings set org.gnome.desktop.interface gtk-theme "Yaru"
    gsettings set org.gnome.desktop.interface icon-theme "Yaru"
    gsettings set org.gnome.shell.extensions.user-theme name "Yaru"
    gsettings set org.gnome.desktop.background picture-uri "file:///usr/share/backgrounds/warty-final-ubuntu.png"
    gsettings set org.gnome.desktop.interface cursor-theme "Yaru"
    gsettings reset org.gnome.shell.extensions.dash-to-dock dock-position
    gsettings reset org.gnome.shell.extensions.dash-to-dock dash-max-icon-size
    gsettings reset org.gnome.shell.extensions.dash-to-dock extend-height
    gsettings reset org.gnome.shell.extensions.dash-to-dock transparency-mode
    gsettings reset org.gnome.shell.extensions.dash-to-dock background-opacity
fi