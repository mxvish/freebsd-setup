#ifconfig wlan0 create wlandev iwlwifi0
#ifconfig wlan0 up
#ifconfig wlan0 scan
#wpa_passphrase '$SSID' > /etc/wpa_supplicant.conf
#vi /etc/wpa_supplicant.conf
##delete psk before hashed
#wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant.conf
#dhclient wlan0

mkdir /mnt/usb
pw groupmod video -m mxvish

pkg update
pkg upgrade -y

pkg install -y btop cmatrix dmenu drm-kmod emacs-nox fastfetch firefox git i3 i3lock i3status ja-font-ipa nasm py312-ranger qemu tree vim xf86-video-intel xf86-video-scfb xfce4-terminal xorg
#echo 'exec i3' >  /home/$(hostname)/.xinitrc

echo 'boot_mute="YES"' >> /boot/loader.conf

echo 'wlans_iwlwifi0="wlan0"
ifconfig_wlan0="WPA DHCP"
keymap="us.pc-ctrl"
rc_startmsgs="NO"
seatd_enable="YES"' >> /etc/rc.conf
#i3-config-wizard #run this in $USER not in su
service seatd start

curl -s https://raw.githubusercontent.com/mxvish/i3config/main/i3status.conf > /etc/i3status.conf
#add "status_command i3status -c /etc/i3status.conf" in .config/i3/config

curl -s https://raw.githubusercontent.com/mxvish/vimrc/main/vimrc > /home/$(hostname)/.vimrc
curl -s https://raw.githubusercontent.com/mxvish/vimrc/main/vimrc > /root/.vimrc

touch /home/$(hostname)/.hushlogin
touch /root/.hushlogin

 echo 'Section "Device"
     Identifier    "Card0"
     Driver        "scfb"
 EndSection' > /usr/local/etc/X11/xorg.conf.d/driver-scfb.conf 

git clone https://github.com/mxvish/i3config.git
cd i3config
mv config /home/$(hostname)/.config/i3/
#i3status?

git clone https://github.com/mxvish/dotfiles
cd dotfiles
mv 00-keyboard.conf /usr/local/etc/X11/xorg.conf.d/

#-disc.iso
#1. Boot Installer
#Install
#continue with default keymap
#set hostname
#select installation type
#  distribution sets
#distribution select
#    none
#partitioning -> manual
#    type        freebsd-ufs
#    size        (your preference)
#    mountpoint  /
#    label   root
#    #created automatically when you create root partition
#    #type    efi
#    #size    (no need to change)
#    #mountpoint /boot/efi
#    #label   (no need to change)
      #finish -> commit
#network installation -> iwlwifi
#regdomain/country -> no
#network configuration -> iwlwifi
#configure ipv4 for this interface ->y
#dhcp -> y
#configure ipv6 for this interface -> n
#resolve configuration -> ok
#is cmos clock set to UTC? -> yes
#mirror selection -> ok
#password
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
#final configuration -> finish
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
