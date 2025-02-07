# Function to run commands with logging and error handling
function run_with_logging
    set -l cmd $argv
    eval $cmd | tee -a /var/log/update.log
    if test $status -ne 0
        echo "Error occurred during: $cmd" | tee -a /var/log/update.log
        exit 1
    end
end

# Update nvm
run_with_logging "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/(curl -s https://api.github.com/repos/nvm-sh/nvm/releases/latest | grep 'tag_name' | string sub -s 2 -e -1)/install.sh | bash"

# Update system packages
run_with_logging fish ~/ubuntu_install/program/mirror-config.fish
run_with_logging fish ~/ubuntu_install/program/fix-dpkg.fish
run_with_logging sudo apt update
run_with_logging sudo apt upgrade -y
run_with_logging sudo apt full-upgrade -y
run_with_logging sudo apt autoremove -y

# Update Android SDK
run_with_logging yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --update

# Update flatpak packages
run_with_logging sudo flatpak update -y

# Update Docker
run_with_logging sudo apt update
run_with_logging sudo apt install --only-upgrade docker-ce docker-ce-cli containerd.io -y

# Update Virtual Machine Manager
run_with_logging wget https://virt-manager.org/download/sources/virt-manager/virt-manager-5.0.0.tar.gz
run_with_logging echo "b7fe1ed4a7959bdaca7a8fd57461dbbf9a205eb23cc218ed828ed88e8b998cb5  virt-manager-5.0.0.tar.gz" | sha256sum -c -
if test $status -eq 0
    run_with_logging tar -xzf virt-manager-5.0.0.tar.gz
    cd virt-manager-5.0.0
    run_with_logging sudo python setup.py install
    cd ..
    run_with_logging rm -rf virt-manager-5.0.0 virt-manager-5.0.0.tar.gz
else
    echo "SHA-256 checksum does not match. Aborting update." | tee -a /var/log/update.log
    exit 1
end

# Clean up
run_with_logging sudo apt autoremove -y
run_with_logging sudo apt clean

