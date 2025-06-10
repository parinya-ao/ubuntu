sudo apt install preload -y

sudo apt instlal ufw -y

sudo apt install openssh-client openssh-server -y
sudo systemctl start sshd
sudo systemctl enable sshd

sudo ufw enable

sudo apt install tlp tlp-rdw -y
sudo systemctl enable tlp
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer

sudo apt install git -y

