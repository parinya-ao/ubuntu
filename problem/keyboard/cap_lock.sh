# change lagnuage to cap lock
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:none', 'grp:caps_toggle']"

sudo apt install dconf-editor
gsettings set org.gnome.desktop.input-sources xkb-options "['grp:caps_toggle']"
