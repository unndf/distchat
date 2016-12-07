#!/bin/sh

USER="bob"
OLDUSER="missmbob"

tmux new -s distchat -d

tmux send-keys -t 0 "./runcli.sh" Enter 
sleep 3s

tmux send-keys -t 0 "!connect" Enter
sleep 3

tmux send-keys -t 0 "!login bob" Enter
sleep 3

tmux send-keys -t 0 "!open tech" Enter
sleep 3

tmux send-keys -t 0 "anyone know why dpkg isnt letting me edit factoids?" Enter
sleep 5

tmux send-keys -t 0 "i have to assume the bot needs to be restarted or something. never seen this before" Enter
sleep 5

tmux send-keys -t 0 "themill: you run the bot, dont you?" Enter
sleep 5

tmux send-keys -t 0 "i usually get it from /boot. but sure, you can get it from the package" Enter
sleep 5

tmux send-keys -t 0 "favioflamingo: no one knows what you're talking about" Enteds
sleep 5

tmux send-keys -t 0 "yeah, you're in the wrong place" Enter
sleep 5

tmux send-keys -t 0 "!mentors" Enter
sleep 5

tmux send-keys -t 0 "favioflamingo: if you didn't know dpkg was a bot you might be laughed at there. do you know what you're doing?" Enter
sleep 5

tmux send-keys -t 0 "!ops Koala69 06:34 < Koala69> la69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala69Koala6'" Enter
sleep 5

tmux send-keys -t 0 "that's...really not so easy anymore. it used to be" Enter
sleep 5

tmux send-keys -t 0 "anyway, why?" Enter
sleep 5
