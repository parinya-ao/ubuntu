# Install Tor
sudo apt update
sudo apt install tor -y

# Configure Tor to change IP every 10 minutes
sudo bash -c 'echo "MaxCircuitDirtiness 600" >> /etc/tor/torrc'

# Restart Tor service to apply changes
sudo systemctl restart tor
