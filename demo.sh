#!/bin/bash
source ./util.sh

talk_to_myself ()
{
    while read -r line; do
        tmux_send $(( ($1-1)% 3 )) "$line"
    done < ./debianlogs/log"$1".txt
}

#open 4 clients
tmux new -s $1 -d
tmux splitw 
tmux select-layout tiled
tmux splitw 
tmux select-layout tiled
tmux splitw 
tmux select-layout tiled

talk_to_myself $(($2 + 1)) &
talk_to_myself $(($2 + 2)) &
talk_to_myself $(($2 + 3)) &
talk_to_myself $(($2 + 4)) &
