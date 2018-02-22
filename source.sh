#!/bin/bash
set -e

dir=$1

config_files=$(ls "$dir" | grep "\-config")

for file in $config_files; do
  suffix=$(echo "$file" | sed 's|\-config||')
  command="kubectl --kubeconfig $dir/$file"

  echo "alias \"k-$suffix=$command\""

  nss=$($command get namespace -o json | jq -r '.items | .[] | .metadata.name')

  for ns in $nss; do
    echo "alias \"k-$suffix-$ns=$command -n $ns\""
  done
done