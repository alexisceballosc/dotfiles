#!/bin/sh
tmux=/opt/homebrew/bin/tmux

if [ "$1" = loop ]; then
  while :; do
    $tmux wait-for lazygit-open
    cd "$($tmux show -gv @lazygit_dir)" && /opt/homebrew/bin/lazygit
    $tmux detach-client -s lazygit
  done
fi

$tmux set -g @lazygit_dir "$1"
$tmux has-session -t lazygit 2>/dev/null || {
  $tmux new-session -d -s lazygit "$0 loop"
  $tmux set -t lazygit status off
  $tmux set -wt lazygit pane-border-status off
}
$tmux wait-for -S lazygit-open
