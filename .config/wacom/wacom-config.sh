#!/bin/zsh

for i in $(seq 10); do
    if xsetwacom list devices | grep -q Wacom; then
        break
    fi
    sleep 1
done

list=$(xsetwacom list devices)

stylus=$(echo "${list}" | awk '/stylus/' | cut -f 2 | cut -d ' ' -f 2)
if [ -z "${stylus}" ]; then
    exit 0
fi

# xsetwacom set "${stylus}" Rotate half
xsetwacom set "${stylus}" MapToOutput HEAD-0
xsetwacom set "${stylus}" Button 3 "pan"
xsetwacom set "${stylus}" PanScrollThreshold 200
xsetwacom set "${stylus}" Suppress 10
xsetwacom set "${stylus}" RawSample 10

pad=$(echo "${list}" | awk '/pad/' | cut -f 2 | cut -d ' ' -f 2)
if [ -z "${pad}" ]; then
    exit 0
fi

xsetwacom set "${pad}" Button 1 2
xsetwacom set "${pad}" Button 2 "key ctrl c ctrl v"
xsetwacom set "${pad}" Button 3 "key del"
xsetwacom set "${pad}" Button 8 "key ctrl z"

# eraser=$(echo "${list}" | awk '/eraser/' | cut -f 2 | cut -d ' ' -f 2)
# if [ -z "${eraser}" ]; then
#     exit 0
# fi
