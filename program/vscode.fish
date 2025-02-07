sudo su
mkdir ~/Download/Temp
cd ~/Download/Temp
curl -o vscode.deb -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo apt install ./vscode.deb
code --version

# Install Neovim
sudo apt install neovim -y

cd 
rm -rf ~/Download/Temp
exit
echo "you download vscode in linux"
# Remove the folder created by the curl command
rm -rf ~/Download/Temp