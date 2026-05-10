#!/usr/bin/env bash
# shellcheck shell=bash
# Prints current window pane count, with a zoom indicator when panes are hidden.

TMUX_POWERLINE_SEG_PANE_STATUS_LABEL="${TMUX_POWERLINE_SEG_PANE_STATUS_LABEL:-panes}"

generate_segmentrc() {
	read -r -d '' rccontents <<EORC
# Label to show after the pane count.
export TMUX_POWERLINE_SEG_PANE_STATUS_LABEL="${TMUX_POWERLINE_SEG_PANE_STATUS_LABEL}"
EORC
	echo "$rccontents"
}

run_segment() {
	local panes zoom prefix label
	panes=$(tmux display-message -p '#{window_panes}') || return 1
	zoom=$(tmux display-message -p '#{window_zoomed_flag}') || return 1
	if [ "${zoom}" = "1" ]; then
		prefix="zoom "
	fi
	label="${TMUX_POWERLINE_SEG_PANE_STATUS_LABEL}"
	if [ "${panes}" = "1" ] && [ "${label}" = "panes" ]; then
		label="pane"
	fi
	echo "${prefix}${panes} ${label}"
	return 0
}
