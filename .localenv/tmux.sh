#!/bin/bash

if tmux has-session -t BLG1 2>/dev/null; then
  tmux attach -t BLG1

else
  tmux new -d -s BLG1
  tmux send-keys -t BLG1 "cd ~/REPO1/BLG1/app1; npm run dev" C-m
  # tmux attach -t BLG1
  tmux ls
fi