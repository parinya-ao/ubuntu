# acer nitro 5 have 120Hz refresh rate
# 1. you can try reduce refreash rate to 90Hz or 60Hz

# 2.reinstal driver gpu nvidia
sudo apt remove intel-media-va-driver
sudo apt remove intel-media-va-driver-non-free

sudo ubuntu-drivers autoinstall

# 3.in file /etc/default/grub add to GRUB_CMDLINE_LINUX_DEFAULT
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nvidia-drm.modeset=1 acpi_backlight=vendor"
sudo update-grub

# 4.using nvidia gpu
sudo prime-select nvidia
echo "blacklist i915" | sudo tee /etc/modprobe.d/blacklist-i915.conf  # ปิด Intel GPU





sudo reboot
