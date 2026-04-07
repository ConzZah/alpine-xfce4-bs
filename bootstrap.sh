#!/usr/bin/env sh

# Author: ConzZah
# Project: alpine-xfce4-bs
# File: bootstrap.sh
# /// bootstrap / pre-setup script ///

## set vars
root_pass="${root_pass:-123}"
hostname="${hostname:-alpine}"
tz="${tz:-Europe/Berlin}"
kbd_lay="${kbd_lay:-de}"
kbd_var="${kbd_var:-de}"
disk="${disk:-/dev/sda}"

## set hostname
setup-hostname "$hostname"
hostname "$hostname"

## restart hostname service
rc-service hostname restart

## setup keymap
setup-keymap "${kbd_lay}" "${kbd_var}"

## setup timezone
setup-timezone -i "${tz}"

## setup interfaces and (re)start networking
setup-interfaces -a -r

## start networking on boot
rc-update add networking boot

## start crond on boot
rc-update add crond boot

## setup ntp
setup-ntp chrony

## setup ssh
setup-sshd openssh

## setup repos
setup-apkrepos -c -1

## change password for root
printf '%s' "root:${root_pass}"| chpasswd

## setup disk
printf 'y'| setup-disk -m sys "$disk"

## create tmpmnt
mkdir -p /root/tmpmnt

## mount the root partition
## and cd to root to prep the main setup script
### NOTE: THIS ASSUMES THAT THE PART NUMBER IS 3 
### (i plan to change that tho)
mount "${disk}3" "/root/tmpmnt"
cd '/root/tmpmnt/root' || exit 1

## download setup.sh
wget "https://github.com/ConzZah/alpine-xfce4-bs/raw/refs/heads/main/setup.sh"
chmod +x 'setup.sh'

## append to crontab (which will get overwritten by setup.sh at runtime)
echo  '@reboot until ping -q -c 1 -w 1 google.com; do sleep 1; done; [ -f /root/setup.sh ] && { /bin/sh /root/setup.sh; rm -f /root/setup.sh ;}
' >> '/root/tmpmnt/var/spool/cron/crontabs/root'

## cd, unmount & reboot
cd || exit 1
umount /root/tmpmnt
sync
reboot
