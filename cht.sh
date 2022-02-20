#!/usr/bin/env bash
languages=`echo "angular javascript nodejs python typescript" | tr ' ' '\n'`
core_utils=`echo "awk find ng sed tmux xargs" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf`
read -p "query: " query

if echo $languages | grep -qs $selected; then
    tmux neww "curl cht.sh/$selected/`echo $query | tr ' ' '+'` ; while : do sleep 1 done"
else
    tmux neww "curl cht.sh/$selected~`echo $query | tr ' ' '+'` ; while : do sleep 1 done"
    #curl cht.sh/$selected~$query 
fi


