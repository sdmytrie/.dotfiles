#!/usr/bin/env bash
languages=`echo "typescript nodejs python" | tr ' ' '\n'`
core_utils=`echo "xargs find sed awk" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf`
read -p "query: " query

if echo $languages | grep -qs $selected; then
    tmux neww "curl cht.sh/$selected/`echo $query | tr ' ' '+'` ; while : do sleep 1 done"
else
    tmux neww "curl cht.sh/$selected~`echo $query | tr ' ' '+'` ; while : do sleep 1 done"
    #curl cht.sh/$selected~$query 
fi


