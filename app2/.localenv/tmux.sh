#!/bin/bash

if tmux has-session -t 3CRK 2>dev>null; then
	tmux attach -t 3CRK
else
	tmux new -d -s 3CRK
	tmux send-keys -t 3CRK 'cd ~/REPO1/3CRK/fe1' C-m
	tmux select-window -t 3CRK
	# tmux attach -t 3CRK 
	tmux ls
fi


