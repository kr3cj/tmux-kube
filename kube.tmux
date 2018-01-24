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

do_interpolation() {
    local all_interpolated="$1"
    for ((i=0; i<${#cpu_commands[@]}; i++)); do
        all_interpolated=${all_interpolated/${kube_interpolation[$i]}/${kube_commands[$i]}}
    done
    echo "$all_interpolated"
}

update_tmux_option() {
    local option=$1
    local option_value=$(get_tmux_option "$option")
    local new_option_value=$( do_interpolation "$option_value")
    set_tmux_option "$option" "$new_option_value"
}

main() {
    update_tmux_option "status-right"
    update_tmux_option "status-left"
}
main
