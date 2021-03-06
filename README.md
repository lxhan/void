# Enter the void

I tried to make it minimal yet available to use all the tools I need and without refusing some decorations. It can be any distro (with some modifications) but I really like void at the moment for simplicity and minimalism. If you want to replicate something similar in void, install it on your computer and follow instructions below.

# Network 

First thing after installation we need internet connection. If you have wired connection it is a little easier but setting up wireless is not hard at all:

```shell
# show network interfaces
ip link show
# copy wpa conf 
cp /etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant-<interface_name>.conf
# set up interface
ip link set up <interface_name>
# set network name and password
wpa_passphrase <ssid> <key> >> /etc/wpa_supplicant/wpa_supplicant-<interface_name>.conf
# enable dhcpcd 
ln -s /etc/sv/dhcpcd /var/service
# enable wpa_supplicant
ln -s /etc/sv/wpa_supplicant /var/service
# restart dhcpcd
sv restart dhcpcd
```

If `wpa_supplicant` is not starting try:
```sh
wpa_supplicant -i <interface_name> -c /etc/wpa_supplicant/wpa_supplicant-<interface_name>.conf
```
and check for errors.

Alternatively you can start `wpa_supplicant` manually:
```sh
wpa_supplicant -B -i <interface_name> -c </etc/wpa_supplicant/wpa_supplicant-<interface_name>.conf
dhcpcd <interface_name>
```

# Mirrors

To make updating and installing packages fast we need to change mirror according to your region. 

```sh
cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
vi /etc/xbps.d/*-repository-*.conf

# ex. change to singapore mirror
repository=https://void.webconverger.org/current

xbps-install -S
```

# Update

Before installing packages we need to update void. Run update command several times:

```sh
xbps-install -Su
```

# Packages

1. Clone this repo if you haven't already:
 
```sh
git clone https://github.com/lxhan/void.git
cd void
```
2. If `git` is not installed:
```sh
sudo xbps-install -S git
```

3. Inspect pkg.sh and then run it:

```sh
chmod +x pkg.sh
./pkg.sh
```
**Attention!** `pkg.sh` contains only 2 commands: `xbps-install -Syu` and `xbps-install -Sy ...packages`. You can remove packages you don't need or add more. Script is only a shortcut so you don't have to type package names.

# Fonts

Install additional fonts for polybar:
```sh
chmod +x fonts/fonts.sh
./fonts/fonts.sh
```

# Configs

To install configs go to void directory which you cloned in previous step:

```sh
cd ~/void/config
stow -t ~/ *
```
Now logout or reboot and hopefully you have something like this:

![screenshot](screenshots/2019-11-12-230518_1918x1079_scrot.png)

**Remark**: you may have to reboot several times and source .zshrc but eventually if you did everything right it should be almost the same as on screenshot except wallpaper.

# Links

- [Void Linux Handbook](https://docs.voidlinux.org/print.html)
- [Configuring wifi in Linux with wpa_supplicant](https://shapeshed.com/linux-wifi/)
- [GNU libc locales disabled by default](https://voidlinux.org/news/2013/05/libc-locales-disabled.html)
- [Dotfiles examples](https://github.com/jmdaly/dotfiles)
- [Another void+bspwm implementation](https://github.com/Speyll/void-bspwm)
- [Dual monitor setup with BSPWM and Polybar](https://protesilaos.com/codelog/multihead-bspwm-polybar/)
- [How to set up a fresh Ubuntu desktop using only dotfiles and bash script](https://victoria.dev/blog/how-to-set-up-a-fresh-ubuntu-desktop-using-only-dotfiles-and-bash-scripts/)
- [Polybar themes](https://github.com/adi1090x/polybar-themes)

# TODO

- [ ] Make installation process with one script
- [ ] Make distro agnostic
