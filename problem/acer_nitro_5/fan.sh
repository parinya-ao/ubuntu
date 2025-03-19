# 1. addsensor 
sudo apt update
sudo apt install lm-sensors fancontrol
sudo sensors-detect
sudo pwmconfig
sudo systemctl enable fancontrol
sudo systemctl start fancontrol

sudo apt install tlp tlp-rdw
sudo tlp start
sudo apt install s-tui
s-tui

sudo add-apt-repository ppa:ernstp/mesarc
sudo apt update
sudo apt install corectrl



