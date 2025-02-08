# Set DNS to 1.1.1.1 or 8.8.4.4
echo "nameserver 1.1.1.1" | sudo tee /etc/resolv.conf
echo "nameserver 8.8.4.4" | sudo tee -a /etc/resolv.conf

# Prompt user to show logs or not
read -P "Show logs? (y/n): " show_logs

# Limit internet bandwidth to focus on installation
sudo tc qdisc add dev eth0 root handle 1: htb default 10
sudo tc class add dev eth0 parent 1: classid 1:1 htb rate 100mbit
sudo tc class add dev eth0 parent 1:1 classid 1:10 htb rate 100mbit

# Function to run commands with maximum CPU utilization and logging
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


# Configure global mirrors
run_with_max_cpu fish ~/ubuntu_install/program/mirror-config.fish

# Fix dpkg if needed
run_with_max_cpu fish ~/ubuntu_install/program/fix-dpkg.fish

# Install Virtual Fish
run_with_max_cpu curl -L https://raw.githubusercontent.com/justinmayer/virtualfish/master/install.py | python3 -

if test "$show_logs" = "y"
    run_with_max_cpu sudo apt install fish
    run_with_max_cpu sudo chsh -s (which fish)
    exit 
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
else
    run_with_max_cpu sudo apt install fish
    run_with_max_cpu sudo chsh -s (which fish)
    exit 
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
end

# Run other scripts
run_with_max_cpu fish ~/ubuntu_install/program/programing.fish
run_with_max_cpu fish ~/ubuntu_install/program/github.fish
run_with_max_cpu fish ~/ubuntu_install/program/docker.fish
run_with_max_cpu fish ~/ubuntu_install/program/android_sdk.fish
run_with_max_cpu fish ~/ubuntu_install/program/vscode.fish
run_with_max_cpu fish ~/ubuntu_install/program/update-all.fish
run_with_max_cpu fish ~/ubuntu_install/program/education.fish

# Remove internet bandwidth limit
sudo tc qdisc del dev eth0 root

# Clean up
sudo apt autoremove -y
sudo apt clean

# Install and enable TLP for power management
run_with_max_cpu sudo apt install tlp tlp-rdw -y
run_with_max_cpu sudo systemctl enable tlp
run_with_max_cpu sudo systemctl start tlp

# Configure firewall to allow port 22
run_with_max_cpu sudo ufw allow 22
run_with_max_cpu sudo ufw enable

# Configure update manager to only notify for LTS releases
sudo bash -c 'echo "Prompt=lts" > /etc/update-manager/release-upgrades'
