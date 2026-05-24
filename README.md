# tmux-dotfiles

Portable tmux setup with TPM, tmux-powerline, an Ember Noir orange/black
two-line status bar, and a custom pane-status segment that shows hidden panes
when a pane is zoomed.

## What It Includes

- `tmux.conf` - tmux key bindings, Ember Noir pane styling, plugins, mouse support, and scroll behavior.
- `tmux-powerline/config.sh` - minimal portable tmux-powerline config.
- `tmux-powerline/themes/ben-minimal.sh` - Ember Noir tmux-powerline theme.
- `tmux-powerline/segments/pane_status.sh` - pane count and zoom indicator.
- `shell/tmux-auto-attach.bash` - optional shell login snippet.
- `install.sh` - installs files and bootstraps TPM.

New panes use `/usr/bin/zsh` by default. If zsh is installed somewhere else on a
machine, update `set-option -g default-shell` in `tmux.conf` after installing.

## Install

```bash
git clone https://github.com/hoombar/tmux-dotfiles.git ~/dev/tmux-dotfiles
~/dev/tmux-dotfiles/install.sh
tmux
```

Inside tmux, press your tmux prefix followed by `I` to install TPM plugins.
This config uses `C-a` as the tmux prefix.

## Optional Shell Auto-Attach

Append this to `~/.bashrc` if you want SSH logins to attach to an existing tmux
session, or create `main` when no session exists:

```bash
source "$HOME/.config/tmux-auto-attach.bash"
```

The auto-attach snippet intentionally attaches to any existing session first.
That avoids creating a new `main` session when the active session has another
name, such as `0`.

For zsh users, source the same snippet from `~/.zshrc` after prompt setup:

```zsh
source "$HOME/.config/tmux-auto-attach.bash"
```

## Pane Status

The left status segment shows:

- `1 pane` for a single pane.
- `3 panes` for multiple panes.
- `zoom 3 panes` when the current window is zoomed and panes are hidden.

## Theme

The active status bar is rendered by `tmux-powerline`, not tmux's built-in
`status-left` and `status-right` values. `tmux.conf` still sets Ember Noir
fallback/status/pane colors, but `erikw/tmux-powerline` takes over the two-line
status bar after TPM loads plugins.

Ember Noir palette:

- Background: `#0f0f0f`
- Surface: `#1a1a1a`
- Text: `#e6e1d9`
- Muted: `#8b8680`
- Orange: `#ff9e3d`
- Amber: `#f5c16c`
- Red: `#ff6b4a`
- Green: `#8fd17f`
