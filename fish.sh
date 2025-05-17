sudo apt install fish -y

# Fish performance tips
set -U fish_greeting ''             
set -gx EDITOR nvim                 
set -gx VISUAL nvim
set -gx PATH $HOME/.cargo/bin $PATH 
starship init fish | source        
zoxide init fish | source
fzf_key_bindings
