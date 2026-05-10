#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$HOME/.tmux/plugins"
mkdir -p "$HOME/.config/tmux-powerline/themes"
mkdir -p "$HOME/.config/tmux-powerline/segments"

if [ ! -d "$HOME/.tmux/plugins/tpm/.git" ]; then
	git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

ln -sfn "$repo_dir/tmux.conf" "$HOME/.tmux.conf"
ln -sfn "$repo_dir/tmux-powerline/config.sh" "$HOME/.config/tmux-powerline/config.sh"
ln -sfn "$repo_dir/tmux-powerline/themes/ben-minimal.sh" "$HOME/.config/tmux-powerline/themes/ben-minimal.sh"
ln -sfn "$repo_dir/tmux-powerline/segments/pane_status.sh" "$HOME/.config/tmux-powerline/segments/pane_status.sh"
ln -sfn "$repo_dir/shell/tmux-auto-attach.bash" "$HOME/.config/tmux-auto-attach.bash"

chmod +x "$repo_dir/tmux-powerline/segments/pane_status.sh"

echo "Installed tmux dotfiles."
echo "Start tmux, then press prefix + I to install TPM plugins."
