#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/helpers.sh"

kube_interpolation=(
    "\#{kube_namespace}"
    "\#{kube_cluster}"
)
kube_commands=(
    "#($CURRENT_DIR/scripts/kube_cluster.sh)"
    "#($CURRENT_DIR/scripts/kube_namespace.sh)"
)

set_tmux_option() {
    local option="$1"
    local value="$2"
    tmux set-option -gq "$option" "$value"
}

main() {
    update_tmux_option "status-right"
    update_tmux_option "status-left"
}
main
