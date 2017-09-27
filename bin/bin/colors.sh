#!/bin/bash
# base00="#2D2D2D"
# base01="#282828"
# base02="#383838"
# base03="#585858"
# base04="#B8B8B8"
# base05="#D8D8D8"
# base06="#E8E8E8"
# base07="#F8F8F8"
# base08="#AB4642"
# base08="#AB4642"
# base09="#DC9656"
# base0A="#F7CA88"
# base0B="#A1B56C"
# base0C="#86C1B9"
# base0D="#7CAFC2"
# base0E="#BA8BAF"
# base0F="#A16946"
FILE=$(cat "$HOME/.base16_theme" | head -n 35 | tail -n +10)
#source <( sed -n '/11/,/35/p' "$HOME/.base16_theme" )
source <( cat "$HOME/.base16_theme" | head -n 35 | tail -n +10 )
SEDEXPR="sed s/\\///g"
base00=$(echo "#$color00" | sed s/\\///g)
base01=$(echo "#$color18" | sed s/\\///g)
base02=$(echo "#$color19" | sed s/\\///g)
base03=$(echo "#$color08" | sed s/\\///g)
base04=$(echo "#$color20" | sed s/\\///g)
base05=$(echo "#$color07" | sed s/\\///g)
base06=$(echo "#$color21" | sed s/\\///g)
base07=$(echo "#$color15" | sed s/\\///g)
base08=$(echo "#$color09" | sed s/\\///g)
base09=$(echo "#$color16" | sed s/\\///g)
base0A=$(echo "#$color03" | sed s/\\///g)
base0B=$(echo "#$color02" | sed s/\\///g)
base0C=$(echo "#$color06" | sed s/\\///g)
base0D=$(echo "#$color04" | sed s/\\///g)
base0E=$(echo "#$color05" | sed s/\\///g)
base0F=$(echo "#$color17" | sed s/\\///g)

echo $base04

c_red="$base08"
c_green="$base0B"
c_yellow="$base0A"
c_blue="$base0D"
c_magenta="$base0E"
c_cyan="$base0C"
c_white="$base05"
c_bright_black="$base03"
c_bright_red="$base08"
c_bright_green="$base0B"
c_bright_yellow="$base0A"
c_bright_blue="$base0C"
c_bright_magenta="$base0E"
c_bright_cyan="$base0C"
c_bright_white="$base07"


base00_nohash="${base00#?}"
base01_nohash="${base01#?}"
base02_nohash="${base02#?}"
base03_nohash="${base03#?}"
base04_nohash="${base04#?}"
base05_nohash="${base05#?}"
base06_nohash="${base06#?}"
base07_nohash="${base07#?}"
base08_nohash="${base08#?}"
base08_nohash="${base08#?}"
base09_nohash="${base09#?}"
base0A_nohash="${base0A#?}"
base0B_nohash="${base0B#?}"
base0C_nohash="${base0C#?}"
base0D_nohash="${base0D#?}"
base0E_nohash="${base0E#?}"
base0F_nohash="${base0F#?}"