# Rename the first window (it's for development, usually vim)
tmux rename-window -t 0 ''
#tmux send-keys -t 0 "nvim" C-m

# Create the second window (shell)
tmux neww
tmux rename-window -t 1 ''

# Create the third window (for htop)
tmux neww
#tmux send-keys -t 2 "sudo htop" C-m
tmux rename-window -t 2 ''

# Create the fourth window (for music/sonos automation)
tmux neww
#tmux send-keys -t 3 "cd /opt/local/lib/node_modules/sonos-http-api/; npm start & sleep 1; sonos-automation" C-m
tmux rename-window -t 3 ''

# Create the fifth window (shell)
tmux neww
tmux rename-window -t 4 ''
