### CLI
zsh / neovim / ranger / htop / cronie / tmux / task

### Wayland
kitty / sway{bg,idle,lock} / dunst / bemenu / j4-dmenu-desktop<sup>AUR</sup>

light / grim + slurp / gammastep / wl-clipboard

### Appearance
ttf-jetbrains-mono / nerd-fonts-jetbrains-mono<sup>AUR</sup> / noto-fonts{-emoji} / otf-ipafont / gnome-themes-extra / papirus-icon-theme

### Tools
udisks2 / android-tools / bluez{-utils} / man-db / tlp / xdg-user-dirs / perl-image-exiftool / git / wget / npm

realtime-privileges / flatpak / ripgrep / jq / scrcpy / cpupower / imagemagick / python-i3ipc

mupdf / imv / mpv / polkit-gnome / gnome-keyring / libnotify / rclone

---
### Base
base / base-devel / linux-{firmware,hardened,hardened-headers} / dkms / intel-ucode

### Disks
ntfs-3g / exfat-utils / dosfstools / mtools / btrfs-progs

### Archiving
zip / unzip / unrar / p7zip

### Boot loader
efibootmgr (uefi) / grub

### Multimedia
pipewire{-alsa,-jack,-pulse} / wireplumber

gst-plugin-pipewire / gst-libav / gst-plugins-{base,good,ugly}

### Security
apparmor / iptables-nft / nftables / bubblewrap-suid / usbguard / rkhunter / arch-audit / firejail / lkrg-dkms<sup>AUR</sup>

### Network
nmap / tcpdump / lsof / networkmanager

---
### Enable AppArmor as default security model
Add this line to `/etc/default/grub`:
```
GRUB_CMDLINE_LINUX="lsm=landlock,lockdown,yama,apparmor,bpf"
```

### Use encrypted /
Add `keyboard`, `keymap` & `encrypt` hooks to `/etc/mkinitcpio.conf`

Add this line to `/etc/default/grub`:
```
GRUB_CMDLINE_LINUX="cryptdevice=/dev/sda3:luksroot"
```

### Load LKRG at boot
Create `lkrg.conf` at `/etc/modules-load.d/` and add:
```conf
# Load LKRG at boot
lkrg
```

### Disabling Avahi
```
# systemctl mask avahi-daemon.service
# systemctl mask avahi-daemon.socket
# systemctl mask avahi-dnsconfd.service
```

### Ssh configuration
Add these lines to `/etc/ssh/sshd_config`:
```
Protocol 2
PermitRootLogin no
PasswordAuthentication no
```

### Usbguard configuration
```conf
# usbguard generate-policy > /etc/usbguard/rules.conf
```

### Disable root account
```
# passwd --lock root
```

### Create the default user
```
# useradd -g users -G wheel -s /bin/zsh kani
```

### Mount options
- `/dev/sda1` (FAT-32) is `/boot` and use `nodev`, `noexec` & `nosuid`

- `/dev/sda2` is the `swap`

- `/dev/sda3` (LUKS+BTRFS) is an encrypted `/` and use `noatime`, `compress=zstd` & `space_cache=v2`

- Subvolumes are `/`, `/home`, `/var/log`, `/.snapshots` & `/var/cache/pacman`

### Install "Ranger devicons"
```
$ git clone https://github.com/alexanderjeurissen/ranger_devicons \
~/.config/ranger/plugins/ranger_devicons
```

### Install "Packer.nvim"
```
$ git clone https://github.com/wbthomason/packer.nvim \
~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
