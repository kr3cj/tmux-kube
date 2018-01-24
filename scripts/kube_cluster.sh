#!/usr/bin/env bash

if [[ "$(command -v kubectl)" ]]; then
    kubecluster=$(kubectl config current-context 2>/dev/null)
    kubecluster="${kubecluster%%.*}"
else
    kubecluster=
fi

echo "$kubecluster"
