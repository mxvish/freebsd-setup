#acpiconf -i 0	#battery capacity

#ls /dev/da* #find usb partition
#mount -t msdosfs /dev/da0p2 /mnt/usb

mkdir /mnt/usb
pw groupmod video -m mxvish
sysrc kld_list+=i915kms

pkg update
pkg upgrade -y

pkg install -y dmenu dmenu-wayland drm-kmod firefox git i3 i3lock i3status neofetch sway vim wayland xf86-video-intel xfce4-terminal xorg
echo 'exec i3' >  /home/mxvish/.xinitrc

echo 'keymap="us.pc-ctrl"
linux_enable="YES"
seatd_enable="YES"' >> /etc/rc.conf
#i3-config-wizard #run this in $USER not in su
service seatd start

curl -s https://raw.githubusercontent.com/mxvish/i3status/main/i3status.conf > /etc/i3status.conf
#add "i3status -c /etc/i3status.conf" in .config/i3/config
