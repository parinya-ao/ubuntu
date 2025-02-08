#!/usr/bin/env fish

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

# Update Flatpak applications
sudo flatpak update -y
