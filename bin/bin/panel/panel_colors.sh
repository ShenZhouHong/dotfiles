#!/bin/bash
source ~/bin/colors.sh
COLOR_BLUE="#FF$base0D_nohash"
COLOR_RED="#FF$base08_nohash"
COLOR_YELLOW="#FF$base0A_nohash"
COLOR_ORANGE="#FF$base09_nohash"
COLOR_PURPLE="#FF$base0E_nohash"
COLOR_GREEN="#FF$base0B_nohash"

COLOR_OK=$COLOR_GREEN
COLOR_ERROR=$COLOR_RED
COLOR_WARNING=$COLOR_YELLOW

COLOR_FOREGROUND="#FF$base07_nohash"
COLOR_BACKGROUND="#FF$base00_nohash"

# FOREGROUND
COLOR_OCCUPIED_FG="$COLOR_FOREGROUND"
COLOR_FREE_FG="#FF$base03_nohash"
COLOR_URGENT_FG="#FF$base08_nohash"
COLOR_FOCUSED_FG="#FF$base0D_nohash"
# unused
COLOR_ACTIVE_MONITOR_FG="#FF$base00_nohash"
COLOR_INACTIVE_MONITOR_FG="#FF$base03_nohash"
COLOR_LAYOUT_FG="#FF$base0A_nohash"
COLOR_TITLE_FG="#FF$base00_nohash"
# default
# (these colors are explicitly set but really the default)
COLOR_FOCUSED_OCCUPIED_FG="$COLOR_FOCUSED_FG"
COLOR_FOCUSED_URGENT_FG="$COLOR_FOCUSED_FG"
COLOR_FOCUSED_FREE_FG="$COLOR_FOCUSED_FG"
COLOR_STATUS_FG="$COLOR_FOREGROUND"

# BACKGROUND
COLOR_FOCUSED_OCCUPIED_BG="$COLOR_BACKGROUND"
COLOR_FOCUSED_FREE_BG="$COLOR_BACKGROUND"
COLOR_FOCUSED_URGENT_BG="$COLOR_BACKGROUND"
# default
# (these colors are explicitly set but really the default)
COLOR_OCCUPIED_BG="$COLOR_BACKGROUND"
COLOR_FREE_BG="$COLOR_BACKGROUND"
COLOR_URGENT_BG="$COLOR_BACKGROUND"
COLOR_LAYOUT_BG="$COLOR_BACKGROUND"
COLOR_STATUS_BG="$COLOR_BACKGROUND"
# unused
COLOR_ACTIVE_MONITOR_BG="$COLOR_BACKGROUND"
COLOR_INACTIVE_MONITOR_BG="$COLOR_BACKGROUND"
COLOR_TITLE_BG="$COLOR_BACKGROUND"

COLOR_POMODORO_ACTIVE="#FF$base08_nohash"
COLOR_POMODORO_PAUSE="#FF$base0B_nohash"
COLOR_POMODORO_INACTIVE="$COLOR_FOREGROUND"

COLOR_CLOCK="$COLOR_POMODORO_PAUSE"
COLOR_DATE="#FF$base0A_nohash"
COLOR_BATTERY_FULL="#FF$base0B_nohash"
COLOR_BATTERY_MEDIUM="#FF$base0A_nohash"
COLOR_BATTERY_EMPTY="#FF$base08_nohash"
COLOR_KEYBOARD="#FF$base0D_nohash"
COLOR_KEYBOARD_DISABLED="#FF$base0_nohash"
COLOR_NETWORK="$COLOR_BLUE"

COLOR_LOCK="$COLOR_BLUE"

SEP_R="\ue0b0"
#SEP_R=""
SEP_L="\ue0b2"
POWERLINE_SEP_S_R="\ue0b1"
POWERLINE_SEP_S_L="\ue0b3"