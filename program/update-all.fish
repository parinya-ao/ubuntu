# Update nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$(curl -s https://api.github.com/repos/nvm-sh/nvm/releases/latest | grep 'tag_name' | cut -d\" -f4)/install.sh | bash

# Update system packages
sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt autoremove -y

# Update Android SDK
yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --update

# Update flatpak packages
sudo flatpak update -y

# Update Docker
sudo apt update
sudo apt install --only-upgrade docker-ce docker-ce-cli containerd.io -y

# Update Virtual Machine Manager
wget https://virt-manager.org/download/sources/virt-manager/virt-manager-5.0.0.tar.gz
echo "b7fe1ed4a7959bdaca7a8fd57461dbbf9a205eb23cc218ed828ed88e8b998cb5  virt-manager-5.0.0.tar.gz" | sha256sum -c -
if [ $? -eq 0 ]; then
    tar -xzf virt-manager-5.0.0.tar.gz
    cd virt-manager-5.0.0
    sudo python setup.py install
    cd ..
    rm -rf virt-manager-5.0.0 virt-manager-5.0.0.tar.gz
else
    echo "SHA-256 checksum does not match. Aborting update."
    exit 1
fi

