#!/bin/zsh

for i in $(seq 10); do
    if xsetwacom list devices | grep -q Wacom; then
        break
    fi
    sleep 1
done

list=$(xsetwacom list devices)

# pad=$(echo "${list}" | awk '/pad/')
# if [ -z "${pad}" ]; then
#     exit 0
# fi

stylus=$(echo "${list}" | awk '/stylus/' | cut -d ' ' -f 1-7)
if [ -z "${stylus}" ]; then
    exit 0
fi

eraser=$(echo "${list}" | awk '/eraser/' | cut -d ' ' -f 1-7)
if [ -z "${eraser}" ]; then
    exit 0
fi

# configure the buttons on ${stylus} with your xsetwacom commands...
#xsetwacom set "${stylus}" Button 2 11
xsetwacom set "${stylus}" Rotate half
xsetwacom set "${stylus}" MapToOutput HEAD-0
xsetwacom set "${stylus}" Button 3 "pan"
xsetwacom set "${stylus}" PanScrollThreshold 200
xsetwacom set "${stylus}" Suppress 10
xsetwacom set "${stylus}" RawSample 10
