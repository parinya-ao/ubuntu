sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish -y

set -U fish_greeting ''             
set -gx EDITOR nvim                 
set -gx VISUAL nvim
set -gx PATH $HOME/.cargo/bin $PATH 
starship init fish | source        
zoxide init fish | source
fzf_key_bindings

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install jorgebucaran/fish-autosuggestions
fisher install PatrickF1/fzf.fish
fisher install ilancosman/tide@v5

curl -sS https://starship.rs/install.sh | sh
starship init fish | source
