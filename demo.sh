#!/bin/sh

#open 4 clients
tmux new -s distchat -d
tmux splitw 
tmux select-layout tiled
tmux splitw 
tmux select-layout tiled
tmux splitw 
tmux select-layout tiled

sh ./debianlogs/log1.sh &
