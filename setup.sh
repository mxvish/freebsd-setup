mkdir /mnt/usb
pw groupmod video -m mxvish
sysrc kld_list+=i915kms

pkg update
pkg upgrade -y

pkg install -y cmatrix dmenu dmenu-wayland drm-kmod firefox git i3 i3lock i3status neofetch sway vim wayland xf86-video-intel xfce4-terminal xorg
echo 'exec i3' >  /home/mxvish/.xinitrc

echo 'boot_mute="YES"' >> /boot/loader.conf

echo 'keymap="us.pc-ctrl"
linux_enable="YES"
rc_startmsgs="NO"
seatd_enable="YES"' >> /etc/rc.conf
#i3-config-wizard #run this in $USER not in su
service seatd start

curl -s https://raw.githubusercontent.com/mxvish/i3config/main/i3status.conf > /etc/i3status.conf
#add "i3status -c /etc/i3status.conf" in .config/i3/config

curl -s https://raw.githubusercontent.com/mxvish/vimrc/main/vimrc > /home/mxvish/.vimrc
curl -s https://raw.githubusercontent.com/mxvish/vimrc/main/vimrc > /root/.vimrc

CURRENT_USER="mxvish"
touch /home/$CURRENT_USER/.hushlogin
touch /root/.hushlogin

#-disc.iso
#1. Boot Multi User
#Install
#continue with default keymap
#set hostname
#distribution select
#    ports
#partitioning -> manual
#    type    freebsd-swap
#    size    4g
#    mountpoint swap
#    label   swap
#    type        freebsd-ufs
#    size        (your preference)
#    mountpoint  /
#    label   root
#    #created automatically when you create root partition
#    #type    efi
#    #size    512m
#    #mountpoint /boot/efi
#    #label   boot
#network installation -> iwlwifi
#regdomain/country -> no
#network configuration -> iwlwifi
#configure ipv4 for this interface ->y
#dhcp -> y
#configure ipv6 for this interface -> n
#resolve configuration -> ok
#is cmos clock set to UTC? -> yes
#select timezone
#system configuration
#    check dumpdev
#sysctl hardening
#    check nothing
#firmware installation
#    check gpu~ and wifi~
#add user accounts -> yes
#    invite user into other groups: wheel
#    leave others empty for default    
#final configuration -> exit
#manual configuration -> no    
#complete -> reboot

#add following code to /boot/grub/grub.cfg
#menuentry "FreeBSD" {
#    set root=(hd0,gpt1)
#    chainloader /efi/freebsd/loader.efi
#    boot
#}

#acpiconf -i 0	#battery capacity

#gpart show -l

#mount -t ext2fs /dev/nvd0p9 /mnt/gentoo

#mount bsd ufs partition from linux
#mount -t ufs -o ufstype=ufs2 /dev/sdb1 /mnt/bsd

#ls /dev/da* #find usb partition
#mount -t msdosfs /dev/da0p2 /mnt/usb

#mixer vol=10%
#mixer vol=+5%

#check how mac is configured(e.g. sysctl) and apply it on fbsd?

#
##settings for installing on virtualbox
#partitioning -> auto(ufs)
#	entire disk
#	partition scheme -> gpt
#	finish
#	commit
#
#pkg install -y virtualbox-ose-additions
#echo 'vboxguest_enable=YES
#vboxservice_enable=YES
#vboxsf_enable=YES' >> /etc/rc.conf
#reboot
#
#mkdir /mnt/oshiken
#mount -t vboxvfs oshiken /mnt/oshiken
#
#vim ~/.xinitrc
##exec sway
#startx	#not sway
#
#mkdir -p ~/.config/sway
#cp /usr/local/etc/sway/config ~/.config/sway/
#chown mxvish:mxvish ~/.config/sway/config
