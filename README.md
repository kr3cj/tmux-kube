# Tmux Kubernetes Context

Shows your current Kubernetes context and namespace

## Installation
### Dependencies

This assumes that you have kubectl installed and have at least one context in your `~/.kube/config` or wherever your KUBECONFIG points.

jq is required for parsing the output.

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`
    set -g @plugin 'kr3cj/tmux-kube'

Hit `prefix + I` to fetch the plugin and source it.

If format strings are added to `status-right` or `status-left` they should be visible, assuming you have the necessary dependencies.

### Manual Installation

Clone the repo:
```    
    $ git clone https://github.com/kr3cj/tmux-kube ~/clone/path
```

Add this line to `~/.tmux.conf`
```
    run-shell ~/clone/path
```

Reload TMUX environment:
```
    $ tmux source ~/.tmux.conf
```

If format strings are added to `status-right` or `status-left` they should be visible, assuming you have the necessary dependencies.

## Usage

Add `#{kube_cluster}`, or  `#{kube_namespace}` to your status line to get current context info.

Basic Example:
```
    set -g status-right '#{kube_cluster}:#{kube_namespace}'
```

You can set which clusters are prod/stage/dev inside your tmux.conf, and use that to colorize the output.

Example:
```
    set -g @kube_prod_clusters 'whatsit'
    set -g @kube_stage_clusters 'whosit'
    set -g @kube_dev_clusters  'thatsit'

    set -g status-left '#{kube_fg} K8S-#{kube_cluster}:#{kube_namespace}'
```

Changing Colors:
```
    set -g @kube_color_dev '#[fg=colour32]'
    set -g @kube_color_stage '#[fg=colour221]'
    set -g @kube_color_prod '#[fg=colour196]'
```

