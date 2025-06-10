# install flatpak and add flathub
sudo apt install flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# install brave 
flatpak install flathub com.brave.Browser -y

# install libreoffice
flatpak install flathub org.libreoffice.LibreOffice -y


