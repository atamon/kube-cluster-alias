#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


for alias in $(cat $DIR/clusters.txt); do
  arr=(${alias//\:/ })
  cluster=${arr[0]}
  suffix=${arr[1]}

  command="kubectl --cluster $cluster"

  echo "alias \"k-$suffix=$command\""

  nss=$($command get namespace -o json | jq -r '.items | .[] | .metadata.name')

  for ns in $nss; do
    echo "alias \"k-$suffix-$ns=$command -n $ns\""
  done

done