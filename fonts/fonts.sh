if [ ! -d ~/.local/share/fonts ]; then
    echo "making fonts directory..."
    mkdir -p ~/.local/share/fonts
fi

if [ -d ~/.local/share/fonts ]; then
    echo "copying to fonts directory..."
    cp -r mononoki ~/.local/share/fonts
    cp IosevkaNerdFontComplete.ttf ~/.local/share/fonts
fi

if [ -d ~/.local/share/fonts/mononoki ] && [ -f ~/.local/share/fonts/IosevkaNerdFontComplete.ttf ]; then
    fc-cache -f -v
    echo "if installed you should see font name..."
    fc-list | grep mononoki
    fc-list | grep Iosevka
fi
