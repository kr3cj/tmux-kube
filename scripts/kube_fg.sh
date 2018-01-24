#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

color_kube_dev_default="#[fg=green]"
color_kube_stage_default="#[fg=yellow]"
color_kube_prod_default="#[fg=red]"

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
    
    if [ $kubecluster in $prod ]; then
        printf $color_kube_prod
    elif [ $kubecluster in $stage ];then
        printf $color_kube_stage
    else
        printf $kube_color_dev
    fi
}

main() {
    get_kube_color_settings
    print_kube_fg
}
main
