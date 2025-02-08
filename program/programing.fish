#!/usr/bin/env fish
# Prompt user to show logs or not
read -p "Show logs? (y/n): " show_logs

if [ "$show_logs" = "y" ]
    
    sudo apt update
    sudo apt install g++ clang -y
    sudo apt install cmake -y
    sudo apt install curl -y
    # install nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
    # Add nvm to fish shell
    set -Ux NVM_DIR $HOME/.nvm
    set -Ux fish_user_paths $NVM_DIR/bin $fish_user_paths
    # Load nvm
    status --is-interactive; and source (nvm init -|psub)
    nvm --version
    nvm install --lts 
    # using nvm node js latest version in fish shell
    nvm list
    nvm alias default lts
    # Source the fish configuration file
    source ~/.config/fish/config.fish
else
     > /dev/null 2>&1
    sudo apt update > /dev/null 2>&1
    sudo apt install g++ clang -y > /dev/null 2>&1
    sudo apt install cmake -y > /dev/null 2>&1
    sudo apt install curl -y > /dev/null 2>&1
    # install nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash > /dev/null 2>&1
    # Add nvm to fish shell
    set -Ux NVM_DIR $HOME/.nvm
    set -Ux fish_user_paths $NVM_DIR/bin $fish_user_paths
    # Load nvm
    status --is-interactive; and source (nvm init -|psub) > /dev/null 2>&1
    nvm --version > /dev/null 2>&1
    nvm install --lts > /dev/null 2>&1
    # using nvm node js latest version in fish shell
    nvm list > /dev/null 2>&1
    nvm alias default lts > /dev/null 2>&1
    # Source the fish configuration file
    source ~/.config/fish/config.fish > /dev/null 2>&1
end
