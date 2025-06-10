sudo apt-add-repository ppa:fish-shell/release-3
sudo install fish -y
chsh -s /usr/bin/fish

set -U fish_greeting ''             
set -gx EDITOR nvim                 
set -gx VISUAL nvim
set -gx PATH $HOME/.cargo/bin $PATH
