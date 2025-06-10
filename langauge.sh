sudo apt install g++ clang -y
sudo apt install openjdk-17-jdk -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 22

# Verify the Node.js version:
node -v # Should print "v22.16.0".
nvm current # Should print "v22.16.0".

# Verify npm version:
npm -v # Should print "10.9.2".

sudo apt install watchman -y
sudo apt install cmake -y
sudo apt install curl -y
sudo apt install -y build-essential curl


