#!/bin/bash

killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

python3 ~/.config/polybar/colour_finder.pyw

polybar mathew &


echo "Launced Polybar"
