if [ -d mononoki ]; then
    echo "installing mononoki font..."
    cp -r mononoki ~/.local/share/fonts
else
    echo "can't find mononoki"
fi


if [ -f IosevkaNerdFontComplete.ttf ]; then
    echo "installing iosevka font..."
    cp IosevkaNerdFontComplete.ttf ~/.local/share/fonts
else
    echo "can't find iosevka"
fi

if [ -d ~/.local/share/fonts/mononoki ] && [ -f ~/.local/share/fonts/IosevkaNerdFontComplete.ttf ]; then
    fc-cache -f -v
    echo "if installed you should see font name..."
    fc-list | grep mononoki
    fc-list | grep Iosevka
fi
