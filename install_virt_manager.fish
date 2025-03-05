flatpak install flathub org.virt_manager.virt-manager -y
sudo apt install libvirt-daemon libvirt-daemon-system qemu-kvm

sudo usermod -aG libvirt $(whoami)
flatpak override --user --filesystem=/var/run/libvirt org.virt_manager.virt-manager
flatpak override --user --talk-name=org.libvirt org.virt_manager.virt-manager

