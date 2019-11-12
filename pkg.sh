sudo xbps-install -Syu &&

sudo xbps-install -Sy \
    # minimal 
    xorg-minimal \
    xorg-fonts \
    xf86-input-synaptics \
    xf86-input-evdev \
    xf86-video-intel \
    # xf86-video-ati \ ATI
    # xf86-video-amdgpu \ AMD
    # xf86-video-nouveau \ NVIDIA
    alsa-utils \
    openntpd \
    simple-mtpfs \
    base-devel \
    libXft-devel \
    libXinerama-devel \
    wireless_tools \
    xdg-utils \
    xbacklight \
    xwinwrap \
    tlp \
    # optional
    xrdb \
    xtitle \
    xclip \
    xprop \
    rsync \
    curl \
    wget \
    bluez \
    bspwm \
    sxhkd \
    polybar \
    neovim \
    git \
    stow \
    youtube-dl \
    feh \
    scrot \
    mpv \
    ranger \
    rxvt-unicode \
    compton \
    zsh \
    rofi \
    dmenu \
    firefox \
    telegram-desktop
    nodejs \
    vscode \
    python3 \
    python3-pip \
    # fonts
    font-Siji \
    termsyn-font
