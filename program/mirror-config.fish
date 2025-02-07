function setup_global_mirrors
    # Backup original sources.list
    sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup

    # Configure global mirrors
    echo "deb http://archive.ubuntu.com/ubuntu/ $(lsb_release -cs) main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu/ $(lsb_release -cs)-updates main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu/ $(lsb_release -cs)-backports main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu/ $(lsb_release -cs)-security main restricted universe multiverse" | sudo tee /etc/apt/sources.list

    # Update package lists
    sudo apt update
end

# Run the configuration
setup_global_mirrors
