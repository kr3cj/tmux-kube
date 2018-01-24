#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

color_kube_dev_default="#[fg=colour32]"
color_kube_stage_default="#[fg=colour221]"
color_kube_prod_default="#[fg=196]"

color_kube_dev=""
color_kube_stage=""
color_kube_prod=""

get_kube_color_settings() {
    color_kube_dev=$(get_tmux_option "@kube_color_dev" "$color_kube_dev_default")
    color_kube_stage=$(get_tmux_option "@kube_color_stage" "$color_kube_stage_default")
    color_kube_prod=$(get_tmux_option "@kube_color_prod" "$color_kube_prod_default")
    prod=$(get_tmux_option "@kube_prod_clusters")
    dev=$(get_tmux_option "@kube_dev_clusters")
    stage=$(get_tmux_option "@kube_stage_clusters")
}

print_kube_fg() {
    kubecluster=$($CURRENT_DIR/kube_cluster.sh)
    if [[ $prod = *"$kubecluster"* ]]; then
        echo "$color_kube_prod"
    elif [[ $stage = *"$kubecluster"* ]];then
        echo "$color_kube_stage"
    else
        echo "$color_kube_dev"
    fi
}

main() {
    get_kube_color_settings
    print_kube_fg
}
main
