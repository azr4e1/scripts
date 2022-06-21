#!/usr/bin/env bash

# check whether brave is already open
APP_ID=$( pgrep -f "brave-browser-stable" )

# if not launch it
if [ -z "$APP_ID" ]; then
    /usr/bin/brave-browser-stable --enable-features=UseOzonePlatform --ozone-platform=wayland
else
    swaymsg '[app_id="brave-browser"] focus'
fi
