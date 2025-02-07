# Install Tor
sudo apt update
sudo apt install tor -y

# Configure Tor to change IP every 10 minutes
echo "MaxCircuitDirtiness 600" | sudo tee -a /etc/tor/torrc

# Restart Tor service to apply changes
sudo systemctl restart tor
