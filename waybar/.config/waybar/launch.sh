#!/bin/sh
# ----------------------------------------------------- 
# Quit running waybar instances
# ----------------------------------------------------- 
killall waybar

# ----------------------------------------------------- 
# Loading the configuration based on the username
# ----------------------------------------------------- 
if [[ $USER = "aaasdmytrie" ]]
then
    waybar -c ~/.config/waybar/myconfig & -s ~/.config/waybar/style.css  
else
    waybar &
fi 

