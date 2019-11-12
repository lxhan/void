#!/bin/bash

external_monitor=$(xrandr --query | grep 'HDMI1')
if [[ $external_monitor == *connected* ]]; then
    xrandr --output LVDS1 --primary --mode 1366x768 --rotate normal --output HDMI1 --mode 1920x1080 --rotate normal --above LVDS1
fi

