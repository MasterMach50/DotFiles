#!/bin/bash

killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

polybar mathew &

echo "Launced Polybar"