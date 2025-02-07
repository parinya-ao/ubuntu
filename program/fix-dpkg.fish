function fix_dpkg
    # Force clean dpkg
    sudo rm /var/lib/dpkg/lock-frontend
    sudo rm /var/lib/dpkg/lock
    sudo rm /var/cache/apt/archives/lock
    
    # Reconfigure dpkg
    sudo dpkg --configure -a
    
    # Clean and update apt
    sudo apt clean
    sudo apt update --fix-missing
    
    # Fix any broken installations
    sudo apt install -f
    sudo apt update
    sudo apt upgrade -y
end

# Run the fix
fix_dpkg
