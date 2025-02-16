echo "nameserver 1.1.1.1" | sudo tee /etc/resolv.conf
echo "nameserver 8.8.4.4" | sudo tee -a /etc/resolv.conf

echo -e "[DEFAULT]\nPrompt=lts" | sudo tee /etc/update-manager/release-upgrades > /dev/null
sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup

# Configure global mirrors
echo "deb http://archive.ubuntu.com/ubuntu/ $(lsb_release -cs) main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu/ $(lsb_release -cs)-updates main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu/ $(lsb_release -cs)-backports main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu/ $(lsb_release -cs)-security main restricted universe multiverse" | sudo tee /etc/apt/sources.list

sudo apt update && sudo apt upgrade -y && sudo apt full-upgrade -y > update.txt
sudo apt install fish
 sudo chsh -s (which fish)
sudo apt install fish
chsh -s (which fish)
snap list | awk '{if(NR>1) print $1}' | xargs -I {} sudo snap remove {}
sudo systemctl stop snapd
sudo systemctl disable snapd
sudo systemctl mask snapd
sudo rm -rf /var/cache/snapd/
sudo rm -rf ~/snap
 sudo apt purge snapd -y
 sudo rm -rf /etc/systemd/system/snapd* /var/lib/snapd
 sudo apt autoremove --purge -y
# using flatpak
sudo apt install flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# install brave
sudo flatpak install flathub com.brave.Browser -y
# install discord
sudo flatpak install flathub com.discordapp.Discord -y

sudo apt autoremove -y
sudo apt clean
 sudo apt install tlp tlp-rdw -y
 sudo systemctl enable tlp
 sudo systemctl start tlp
 sudo ufw allow 22
 sudo ufw enable
sudo bash -c 'echo "Prompt=lts" > /etc/update-manager/release-upgrades'

sudo apt remove docker docker-engine docker.io containerd runc
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt install docker-compose -y  # Added Docker Compose installation
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER
newgrp docker

#!/usr/bin/env fish
curl -o vscode.deb -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo apt install ./vscode.deb
code --version
sudo apt install g++ clang -y
sudo apt install openjdk-17-jdk -y
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install lts
sudo apt install watchman -y
sudo apt install cmake -y
sudo apt install curl -y
sudo apt install -y build-essential curl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
# install using flatpak
# obsidian
flatpak install flathub md.obsidian.Obsidian -y
# Okular
flatpak install flathub org.kde.okular -y
# obs
flatpak install flathub com.obsproject.Studio -y
# anki
flatpak install flathub net.ankiweb.Anki -y
# alternative browser zen
flatpak install flathub app.zen_browser.zen -y
flatpak install flathub io.gitlab.librewolf-community -y
# libreoffice
flatpak install flathub org.libreoffice.LibreOffice -y
flatpak install flathub dev.lapce.lapce -y
flatpak install flathub com.vscodium.codium -y
flatpak install flathub com.vscodium.codium-insiders -y
sudo apt install preload -y
sudo apt install zram-tools -y
echo "zram" | sudo tee -a /etc/modules
echo "options zram num_devices=1" | sudo tee -a /etc/modprobe.d/zram.conf
echo 'KERNEL=="zram0", ATTR{disksize}="2G", RUN="/sbin/mkswap /dev/zram0", RUN+="/sbin/swapon /dev/zram0 -p 100"' | sudo tee /etc/udev/rules.d/99-zram.rules

sudo apt install ufw -y
sudo apt install ssh -y
sudo ufw enable
sudo apt install rcconf -y
sudo rcconf
sudo apt install tlp tlp-rdw -y
sudo systemctl enable tlp
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer

sudo apt install git -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:github-cli/cli
sudo apt install gh -y
git config --global user.name (read -p "Enter your GitHub username: "; echo $REPLY)
git config --global user.email (read -p "Enter your GitHub email: "; echo $REPLY)
gh auth login
# Wait for the login to complete
sudo apt autoremove -y
sudo apt autoclean -y
sudo apt clean -y
read -p "Press Enter to continue after completing GitHub login..."
