echo "nameserver 1.1.1.1" | sudo tee /etc/resolv.conf
echo "nameserver 8.8.4.4" | sudo tee -a /etc/resolv.conf

sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup

# Configure global mirrors
echo "deb http://archive.ubuntu.com/ubuntu/ $(lsb_release -cs) main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu/ $(lsb_release -cs)-updates main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu/ $(lsb_release -cs)-backports main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu/ $(lsb_release -cs)-security main restricted universe multiverse" | sudo tee /etc/apt/sources.list

# Update package lists
sudo apt update

function run_with_max_cpu
    set -l cmd $argv
    if test "$show_logs" = "y"
        sudo nice -n -20 taskset -c 0-(math (nproc) - 1) $cmd | tee -a /var/log/install.log
    else
        sudo nice -n -20 taskset -c 0-(math (nproc) - 1) $cmd > /dev/null 2>&1
    end
    if test $status -ne 0
        echo "Error occurred during: $cmd" | tee -a /var/log/install.log
        echo "Retrying without maximum CPU utilization..."
        if test "$show_logs" = "y"
            sudo $cmd | tee -a /var/log/install.log
        else
            sudo $cmd > /dev/null 2>&1
        end
        if test $status -ne 0
            echo "Error occurred during: $cmd" | tee -a /var/log/install.log
            exit 1
        end
    end
end

sudo apt install fish
run_with_max_cpu sudo chsh -s (which fish)
run_with_max_cpu sudo apt install fish
run_with_max_cpu chsh -s (which fish)
run_with_max_cpu snap list | awk '{if(NR>1) print $1}' | xargs -I {} sudo snap remove {}
run_with_max_cpu sudo systemctl stop snapd
run_with_max_cpu sudo systemctl disable snapd
run_with_max_cpu sudo systemctl mask snapd
run_with_max_cpu sudo rm -rf /var/cache/snapd/
run_with_max_cpu sudo rm -rf ~/snap
run_with_max_cpu sudo apt purge snapd -y
run_with_max_cpu sudo rm -rf /etc/systemd/system/snapd* /var/lib/snapd
run_with_max_cpu sudo apt autoremove --purge -y
run_with_max_cpu sudo apt update
# using flatpak
run_with_max_cpu sudo apt install flatpak
run_with_max_cpu sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# install brave
run_with_max_cpu sudo flatpak install flathub com.brave.Browser -y
# install discord
run_with_max_cpu sudo flatpak install flathub com.discordapp.Discord -y
# install Virtual Machine Manager
run_with_max_cpu wget https://virt-manager.org/download/sources/virt-manager/virt-manager-5.0.0.tar.gz
run_with_max_cpu echo "b7fe1ed4a7959bdaca7a8fd57461dbbf9a205eb23cc218ed828ed88e8b998cb5  virt-manager-5.0.0.tar.gz" | sha256sum -c -
if test $status -eq 0
    run_with_max_cpu tar -xzf virt-manager-5.0.0.tar.gz
    cd virt-manager-5.0.0
    run_with_max_cpu sudo python setup.py install
    cd ..
    run_with_max_cpu rm -rf virt-manager-5.0.0 virt-manager-5.0.0.tar.gz
else
    echo "SHA-256 checksum does not match. Aborting installation." | tee -a /var/log/install.log
    exit 1
end

sudo apt autoremove -y
sudo apt clean
run_with_max_cpu sudo apt install tlp tlp-rdw -y
run_with_max_cpu sudo systemctl enable tlp
run_with_max_cpu sudo systemctl start tlp
run_with_max_cpu sudo ufw allow 22
run_with_max_cpu sudo ufw enable
sudo bash -c 'echo "Prompt=lts" > /etc/update-manager/release-upgrades'

# docker zone
#!/usr/bin/env fish
sudo apt update && sudo apt upgrade -y
sudo apt remove docker docker-engine docker.io containerd runc
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt install docker-ce docker-ce-cli containerd.io -y
sudo apt install docker-compose-plugin -y  # Added Docker Compose plugin installation
sudo apt install docker-compose -y  # Added Docker Compose installation
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER
newgrp docker

#!/usr/bin/env fish
curl -o vscode.deb -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo apt install ./vscode.deb
code --version


sudo apt update
sudo apt install g++ clang -y
sudo apt install cmake -y
sudo apt install curl -y
sudo apt update && sudo apt upgrade -y
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

sudo apt update
sudo apt install git -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:github-cli/cli
sudo apt update
sudo apt install gh -y
git config --global user.name (read -p "Enter your GitHub username: "; echo $REPLY)
git config --global user.email (read -p "Enter your GitHub email: "; echo $REPLY)
gh auth login
# Wait for the login to complete
read -p "Press Enter to continue after completing GitHub login..."