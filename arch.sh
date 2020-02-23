loadkeys us

dhcpcd

ping -c 3 www.google.com

ip link

timedatectl set-ntp true
timedatectl set-timezone Europe/Bucharest
hwclock --systohc --utc

date

pacman -Syyy

pacman -S reflector

reflector --verbose --latest 100 --sort rate --save /etc/pacman.d/mirrorlist

fdisk -l

cfdisk /dev/sda [bootable]

mount /dev/sda1 /mnt

pacstrap -i /mnt base base-devel

pacman-key --init
pacman-key --populate archlinux
pacman-key --refresh-keys

genfstab -U -p /mnt >> /mnt/etc/fstab

arch-chroot /mnt /bin/bash

pacman -S nano

nano /etc/locale.gen [remove '#' in front of 'en_US.UTF-8 UTF-8']

locale-gen

ln -sf /usr/share/zoneinfo/Europe/Bucharest /etc/localtime

hwclock --systohc --utc

echo void > /etc/hostname

nano /etc/hosts {

127.0.0.1	localhost.localhomain	localhost	void
::1			localhost.localdomain	localhost	void
127.0.1.1	localhost.localdomain	localhost	void

}

passwd [root password]

pacman -S grub sudo dhcpcd netctl wpa_supplicant iw dialog broadcom-wl linux linux-headers linux-firmware

grub-install /dev/sda

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable dhcpcd

exit [chroot]

umount -R /mnt

reboot

useradd -m -g users -G wheel -s /bin/bash void

passwd void

nano /etc/sudoers {

[remove '#' in front of '%wheel']

}

exit [root] and login as user [void]

sudo pacman -Syyyu

sudo pacman -S pulseaudio pulseaudio-alsa alsa-utils [if no sound, execute 'alsactl init']

sudo pacman -S xorg-server xf86-video-ati xf86-video-amdgpu

sudo pacman -S i3-wm dmenu i3status xfce4-terminal firefox polkit-gnome

sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings

sudo systemctl enable lightdm

echo "exec i3" > ~/.xinitrc
