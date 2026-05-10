# Auto-attach to tmux over interactive shell logins.
if command -v tmux >/dev/null 2>&1 && [ -z "$TMUX" ]; then
	tmux attach-session 2>/dev/null || tmux new-session -s main
fi
