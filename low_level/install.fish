sudo apt update && sudo apt upgrade -y && sudo apt full-upgrade -y
sudo apt-get update

curl -L -o codium_1.97.2.25045_amd64.deb https://github.com/VSCodium/vscodium/releases/download/1.97.2.25045/codium_1.97.2.25045_amd64.deb
sudo dpkg -i codium_1.97.2.25045_amd64.deb
sudo apt-get install -f -y

# compiler
sudo apt install iverilog gtkwave -y
sudo apt install nasm -y
sudo apt isntall spim qtspim -y
sudo apt install gcc-riscv64-linux-gnu -y
sudo apt install clang gcc -y

# addtional 
apt install build-essential meson gperf flex desktop-file-utils libgtk-3-dev \
            libbz2-dev libjudy-dev libgirepository1.0-dev -y

# extension vscode
codium --install-extension ms-vscode.cpptools
codium --install-extension dan-c-underwood.arm
codium --install-extension maziac.asm-code-lens
codium --install-extension mshr-h.veriloghdl
codium --install-extension wakatime.vscode-wakatime
codium --install-extension PKief.material-icon-theme
