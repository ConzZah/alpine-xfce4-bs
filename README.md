# alpine-xfce4-bs

![414087952-78197726-51a4-4263-ba70-b886d2d02337(1)](https://github.com/user-attachments/assets/c4e559a2-916e-4260-a663-f49fc03d3ff9)

## what you get:

- a fully configured xfce desktop environment
- basic system utils, ufw with defaults, network-manager, librewolf, mpv, ffmpeg, fastfetch, pipewire, python etc.
- bash as main shell
- DOOM + SameBoy

## NOTES

**DO NOT** attempt to run bootstrap.sh on an already set up system, as it will wipe your drive while attempting to install the base system.

I'll say it again,

**THIS IS FOR FRESH INSTALLS ONLY**

**IF YOU TRY TO HOLD ME ACCOUNTABLE FOR YOUR INABILITY TO COMPREHEND THIS, I'LL LAUGH AT U**

**YOU HAVE HEREBY BEEN WARNED.**

**also, please be aware that:**

- this is in **BETA**
- i do this **because i have fun with it, i ain't getting paid bro.** if something breaks, let me know, and i'll see if i find time.

### HOW TO USE:
- download bootstrap.sh and put it on a usb drive
- get the alpine stock image and flash it to another usb drive
- boot the stock image and mount your usb drive with bootstrap.sh on it
- make sure you have a LAN cable plugged in
- execute bootstap.sh

this will then automagically:
- install the base system for u
- pull in setup.sh and put it in the root crontab
- reboot
- execute setup.sh, which will put everything else in place

If you find a bug, or have a suggestion, don't hesitate to let me know.

**THANKS TO EVERYONE WRITING SOFTWARE ON/WITH/FOR ALPINE LINUX !!**

**also, thanks to my dad for the motivation.**

**Cheers, ConzZah**
