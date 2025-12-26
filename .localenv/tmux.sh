#!/bin/bash

if tmux has-session -t BLG1 2>/dev/null; then
  tmux attach -t BLG1

else
  tmux new -d -s BLG1 -n APP1
  tmux new-window -t BLG1 -n APP2
  tmux new-window -t BLG1 -n APP3
  tmux split-window -v -t BLG1:APP2
  tmux split-window -v -t BLG1:APP3

  tmux send-keys -t BLG1:APP1 "cd ~/REPO1/BLG1/app1; npm run dev" C-m
  
  tmux send-keys -t BLG1:APP2.0 "cd ~/REPO1/BLG1/app2/fe1/" C-m # ; npm run dev
  tmux send-keys -t BLG1:APP2.1 "cd ~/REPO1/BLG1/app2/be1/" C-m # ; npm run dev
  
  tmux send-keys -t BLG1:APP3.0 "cd ~/REPO1/BLG1/app4/be1/" C-m # ; npm run dev
  tmux send-keys -t BLG1:APP3.1 "cd ~/REPO1/BLG1/app4/be1/" C-m # ; npm run dev

  # tmux attach -t BLG1
  tmux ls
fi