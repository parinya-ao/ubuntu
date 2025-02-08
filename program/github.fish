# Prompt user to show logs or not
read -p "Show logs? (y/n): " show_logs

if [ "$show_logs" = "y" ]; then
    
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
    exit
else
     > /dev/null 2>&1
    sudo apt update > /dev/null 2>&1
    sudo apt install git -y > /dev/null 2>&1
    sudo apt install software-properties-common -y > /dev/null 2>&1
    sudo add-apt-repository ppa:github-cli/cli > /dev/null 2>&1
    sudo apt update > /dev/null 2>&1
    sudo apt install gh -y > /dev/null 2>&1
    git config --global user.name (read -p "Enter your GitHub username: "; echo $REPLY) > /dev/null 2>&1
    git config --global user.email (read -p "Enter your GitHub email: "; echo $REPLY) > /dev/null 2>&1
    gh auth login > /dev/null 2>&1
    # Wait for the login to complete
    read -p "Press Enter to continue after completing GitHub login..."
    exit
fi
