# Prompt user to show logs or not
read -p "Show logs? (y/n): " show_logs

if [ "$show_logs" = "y" ]; then
    sudo su
    sudo apt install fish
    sudo chsh -s $(which fish)
    exit 
    chsh -s $(which fish)
    sudo su
    snap list | awk '{if(NR>1) print $1}' | xargs -I {} sudo snap remove {}
    sudo systemctl stop snapd
    sudo systemctl disable snapd
    sudo systemctl mask snapd
    sudo rm -rf /var/cache/snapd/
    sudo rm -rf ~/snap
    sudo apt purge snapd -y
    sudo rm -rf /etc/systemd/system/snapd* /var/lib/snapd
    sudo apt autoremove --purge -y
    sudo apt update
    # using flatpak
    sudo apt install flatpak
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    # install brave
    sudo flatpak install flathub com.brave.Browser -y
    # install discord
    sudo flatpak install flathub com.discordapp.Discord -y
    # install Virtual Machine Manager
    wget https://virt-manager.org/download/sources/virt-manager/virt-manager-5.0.0.tar.gz
    echo "b7fe1ed4a7959bdaca7a8fd57461dbbf9a205eb23cc218ed828ed88e8b998cb5  virt-manager-5.0.0.tar.gz" | sha256sum -c -
    if [ $? -eq 0 ]; then
        tar -xzf virt-manager-5.0.0.tar.gz
        cd virt-manager-5.0.0
        sudo python setup.py install
        cd ..
        rm -rf virt-manager-5.0.0 virt-manager-5.0.0.tar.gz
    else
        echo "SHA-256 checksum does not match. Aborting installation."
        exit 1
    fi
else
    sudo su > /dev/null 2>&1
    sudo apt install fish > /dev/null 2>&1
    sudo chsh -s $(which fish) > /dev/null 2>&1
    exit 
    chsh -s $(which fish) > /dev/null 2>&1
    sudo su > /dev/null 2>&1
    snap list | awk '{if(NR>1) print $1}' | xargs -I {} sudo snap remove {} > /dev/null 2>&1
    sudo systemctl stop snapd > /dev/null 2>&1
    sudo systemctl disable snapd > /dev/null 2>&1
    sudo systemctl mask snapd > /dev/null 2>&1
    sudo rm -rf /var/cache/snapd/ > /dev/null 2>&1
    sudo rm -rf ~/snap > /dev/null 2>&1
    sudo apt purge snapd -y > /dev/null 2>&1
    sudo rm -rf /etc/systemd/system/snapd* /var/lib/snapd > /dev/null 2>&1
    sudo apt autoremove --purge -y > /dev/null 2>&1
    sudo apt update > /dev/null 2>&1
    # using flatpak
    sudo apt install flatpak > /dev/null 2>&1
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo > /dev/null 2>&1
    # install brave
    sudo flatpak install flathub com.brave.Browser -y > /dev/null 2>&1
    # install discord
    sudo flatpak install flathub com.discordapp.Discord -y > /dev/null 2>&1
    # install Virtual Machine Manager
    wget https://virt-manager.org/download/sources/virt-manager/virt-manager-5.0.0.tar.gz > /dev/null 2>&1
    echo "b7fe1ed4a7959bdaca7a8fd57461dbbf9a205eb23cc218ed828ed88e8b998cb5  virt-manager-5.0.0.tar.gz" | sha256sum -c - > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        tar -xzf virt-manager-5.0.0.tar.gz > /dev/null 2>&1
        cd virt-manager-5.0.0
        sudo python setup.py install > /dev/null 2>&1
        cd ..
        rm -rf virt-manager-5.0.0 virt-manager-5.0.0.tar.gz
    else
        echo "SHA-256 checksum does not match. Aborting installation."
        exit 1
    fi
fi