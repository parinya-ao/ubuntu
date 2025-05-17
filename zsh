sudo apt install zsh -y

chsh -s $(which zsh)

git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote
echo 'source ~/.antidote/antidote.zsh' >> ~/.zshrc
echo 'antidote load' >> ~/.zshrc

cat ~/.zsh_plugins.txt
echo "
zsh-users/zsh-autosuggestions
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-completions
Aloxaf/fzf-tab" > ~/.zsh_plugins.txt

antidote bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.zsh

curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init zsh)"' >> ~/.zshrc

wget "https://app.warp.dev/get_warp?package=deb"
