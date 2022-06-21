#!/usr/bin/env bash

# check whether keepassxc is already open
APP_ID=$( pgrep -f "keepassxc" )

# if not launch it
if [ -z "$APP_ID" ]; then
    keepassxc
else
    swaymsg '[app_id="org.keepassxc.KeePassXC"] focus'
fi
