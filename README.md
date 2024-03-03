## Partition and filesystem

- Make true that system is boot in EFI mode: `ls /sys/firmware/efi/efivars`.
- Create partition with cgdisk.
- Root filesystem：`mkfs.btrfs -L root -n 32k /dev/sda2`.

## Kernel config

- Check device driver: `lspci -kv`
- `mv /dotfiles/gentoo/.config /usr/src/linux/.config`.
- Enable TTY display.
  ```
  1. CONFIG_FB_VESA=y
  2. CONFIG_FB_EFI=y
  3. CONFIG_FB_SIMPLE=y
  ```

## Grub

1. Install playmouth.
2. `sudo plymouth-set-default-theme solar`.
3. `sudo dracut --force`.
4. Add `GRUB_TIMEOUT=0`, `GRUB_HIDDEN_TIMEOUT=0` and `GRUB_CMDLINE_LINUX_DEFAULT="quiet loglevel=0 vt.global_cursor_default=0 splash"` to /etc/default/grub.
5. Run `grub-mkconfig -o /boot/grub/grub.cfg`.
6. [Install grub theme grub2-themes](https://github.com/vinceliuice).

## User

- Set fish as default shell `chsh -s /usr/bin/fish`.
- Accept easy password: change "enforce" option from "everyone" to "none" in the /etc/security/passwdqc.conf.

## Fonts

- /etc/locale.gen
  ```
  en_US.UTF-8 UTF-8
  zh_CN.UTF-8 UTF-8
  ```
- Fonts:
  ```
  2. Install media-fonts/nerd-fonts.
  ```

# [Fcitx](https://wiki.gentoo.org/wiki/Fcitx)

1. Install fcitx-rime, fcitx-configtool.
2. Switch simple and tradition with `Shift + space`.
3. [Config rime](https://github.com/rime/home/wiki).
4. [Install easy_en](https://github.com/BlindingDark/rime-easy-en).

## Pali keyboard layout

- [keyboard layout on sway](https://github.com/swaywm/sway/issues/4250)

## Cursor theme

1. [Install gentoo-xcursor](https://wiki.gentoo.org/wiki/Cursor_themes).
2. Add `seat seat0 xcursor_theme gentoo` in sway config.

## Portage

- [Search package](https://gpo.zugaina.org/app-i18n/fcitx)
- `sudo emerge --ask app-portage/cfg-update`.
- `sudo emerge -av @system @tools`
- `ei @packages` install custom packages.

## Network

- Install and enable `iwd` and `dhcpcd`.
- Enable systemd-networkd.service.
- Enable systemd-resolved.service.

## ssh

- Generate ssh key `ssh-keygen -t ed25519 -C "example@outlook.com"`.
- [add to github](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).
- Clone repository with `git clone git@...`.

## Wireguard

- Install wireguard server [on centos7.6](https://raw.githubusercontent.com/atrandys/wireguard/master/wireguard_install.sh).
- ssh-copy-id `wireguard server`.
- Install `wireguard-tools`.
- [Client config](https://tech.serhatteker.com/post/2021-01/how-to-set-up-wireguard-client-on-ubuntu-desktop/).
- /etc/resolv.conf
  ```
  nameserver 114.114.114.114
  ```

## Audio

1. Install pavucontrol.
2. pulseaudio --check && pulseaudio -D.

## Fish

- set `fish` as default shell：`chsh -s /usr/bin/fish`.

## Alacritty

- [Install alacritty-themes](https://github.com/rajasegar/alacritty-themes).
- Windows
  ```
  1. located in C:\Users\shun\AppData\Roaming\.
  2. send start.bat to desktop.
  3. change name and icon.
  4. create shortcut.
  ```

## Node

- pnpm
  ```
  fish_add_path /home/shun/.local/share/pnpm
  # pnpm config set registry https://registry.npm.taobao.org
  pnpm config set -g auto-install-peers true
  pnpm install -g n
  sudo n lts
  `cat pnpm-package-list.txt | xargs pnpm add -g`
  `add "/home/shun/.local/share/pnpm" to secure_path with visudo.
  ```

## Python virtualenv

- `virtualenv .python/venv`
- `source .python/venv/bin/activate.fish`

## Sioyek

- Install sys-fs/fuse:0.
- Open appimage.

## Brightness

- Install `app-misc/ddcutil`
- Detects monitors `sudo ddcutil detect`
- Get vcp code `sudo ddcutil vcpinfo | grep Bright`
- Get current brightness `sudo ddcutil getvcp code`
- Adjust brightness `sudo ddcutil setvcp code - 10`

## Upgrade kernel
1. `eu`
2. `sudo eselect kernel list`
3. `sudo eselect kernel set <number of kernel name>`
4. `copy kernel .config`
5. `sudo make oldconfig`
6. `sudo make -j8`
7. `sudo make modules_install`
8. `sudo make install`
10. `emerge --ask @module-rebuild`
11. `sudo dracut --kver=6.1.57-gentoo`
12. `remove old kernel dir and boot entry`
13. `grub-mkconfig -o /boot/grub/grub.cfg`
14. `reboot`
