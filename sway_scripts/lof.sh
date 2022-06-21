#!/usr/bin/env bash

# launch a program or focus it if already present
# if already running, moves the window in the
# current workspace, else it launches it
#
# usage:
#   lof <path_to_exec>
# if it necessary to use full path because
# we check the pid

# command
APP_NAME="$@"

# pid
APP_ID=$( pgrep -f "^$APP_NAME$" )

# if not running launch it
if [ -z "$APP_ID" ]; then
    $APP_NAME
# else find the window hexadecimal
# identifier and focus the window
else
    # identify window hexadecimal identifier
    WM_ID=$( wmctrl -lp | grep "$APP_ID" | cut -d " " -f1 )
    # now move the window to current workspace and focus it
    wmctrl -i -R "$WM_ID"
fi
