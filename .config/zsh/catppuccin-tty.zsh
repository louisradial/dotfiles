#!/usr/bin/env bash

if [ "$TERM" = "linux" ]; then
    printf %b '\e]P01e1e2e' # set background color to "Base"
    printf %b '\e]P8585B70' # set bright black to "Surface2"

    printf %b '\e]P7BAC2DE' # set text color to "Subtext1"
    printf %b '\e]PFA6ADC8' # set bright white to "Subtext0"

    printf %b '\e]P1F38BA8' # set red to "Red"
    printf %b '\e]P9F38BA8' # set bright red to "Red"

    printf %b '\e]P2A6E3A1' # set green to "Green"
    printf %b '\e]PAA6E3A1' # set bright green to "Green"

    printf %b '\e]P3FAB387' # set yellow to "Peach"
    printf %b '\e]PBFAB387' # set bright yellow to "Peach"

    printf %b '\e]P489B4FA' # set blue to "Blue"
    printf %b '\e]PC89B4FA' # set bright blue to "Blue"

    printf %b '\e]P5CBA6F7' # set magenta to "Mauve"
    printf %b '\e]PDCBA6F7' # set bright magenta to "Mauve"

    printf %b '\e]P694E2D5' # set cyan to "Teal"
    printf %b '\e]PE94E2D5' # set bright cyan to "Teal"

    clear
fi
