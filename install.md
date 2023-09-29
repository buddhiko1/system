## Install

  1. username = "shun"
  2. add 'wireguard-tool', 'fish', 'sway' and 'basic develop' in SoftManager before install.
  3. `chsh -s /usr/bin/fish`

## zypper

  1. `sudo zypper ar -cfp 90 https://ftp.fau.de/packman/suse/openSUSE_Tumbleweed/ packman`.
  2. `sudo zypper ar https://repo.vivaldi.com/archive/vivaldi-suse.repo`
  3. `cat suse/app | xargs sudo zypper in`

## ssh

  1. Generate ssh key: `ssh-keygen -t ed25519 -C "example@outlook.com"`
  2. add public key to github.
  3. ssh-copy-id: `wireguard server`
  4. run "git push" under a project dir for github init.

## dotfiles

  1. `git clone git@github.com:buddhiko1/dotfiles.git`
  3. `./deploy.sh`

## Yast
    - `tilda`
    - `sudo yast`

## Fonts

  1. Download fonts from tianyiyun and extract it to /usr/share/fonts.

# Fcitx

  1. Switch simple and tradition with `Shift + space`.
  2. [Config rime](https://github.com/rime/home/wiki).
  3. [Install easy_en](https://github.com/BlindingDark/rime-easy-en).
  4. input method: 'Rime'.

## Grub

  1. Install playmouth.
  2. `sudo plymouth-set-default-theme solar`.
  3. `sudo dracut --force`.
  4. Add `GRUB_TIMEOUT=0`, `GRUB_HIDDEN_TIMEOUT=0` and `GRUB_CMDLINE_LINUX_DEFAULT="quiet loglevel=0 vt.global_cursor_default=0 splash"` to /etc/default/grub.
  5. Run `grub-mkconfig -o /boot/grub/grub.cfg`.

## pnpm

    ```
    sudo npm install -g pnpm
    pnpm setup
    pnpm config set registry https://registry.npm.taobao.org
    pnpm config set -g auto-install-peers true


    cat pnpm-package-list.txt | xargs pnpm add -g
    add "/home/shun/.local/share/pnpm" to secure_path in visudo

    pnpm install -g n
    sudo n lts
    ```

## Brightness

- Install `app-misc/ddcutil`
- Detects monitors `sudo ddcutil detect`
- Get vcp code `sudo ddcutil vcpinfo | grep Bright`
- Get current brightness `sudo ddcutil getvcp code`
- Adjust brightness `sudo ddcutil setvcp code - 10`
