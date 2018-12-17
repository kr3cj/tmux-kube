#!/usr/bin/env bash

if [[ -n "$(command -v kubectl)" && -n "$(command -v jq)"  ]]; then
    kubecluster=$(kubectl config current-context 2>/dev/null)
    kubens=$(kubectl config view --output json | jq ".contexts[] | select(.name==\"${kubecluster}\") | .context.namespace" | tr -d '"' || '')
else
    kubens=
fi

echo "$kubens"
