#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "Please input only namespace name"
  exit 1
fi
ns=$1
kubectl get ns ${ns} -o json > tmp.json
check=$(cat tmp.json | jq -r '.spec.finalizers // empty')

if [[ ! -z "$check" ]]; then
    # do something
    echo ''
    cat ./tmp.json | jq 'del(.spec.finalizers[])' > ./modify.json
    kubectl replace --raw "/api/v1/namespaces/${ns}/finalize" -f ./modify.json
    cat ./tmp.json | jq 'del(.metadata.finalizers[])' > ./modify.json
    kubectl replace --raw "/api/v1/namespaces/${ns}/finalize" -f ./modify.json
fi

if [[ -z "$check" ]]; then
    # do something
    echo 'empty'
    cat ./tmp.json | jq 'del(.metadata.finalizers[])' > ./modify.json
    kubectl replace --raw "/api/v1/namespaces/${ns}/finalize" -f ./modify.json
fi

rm -f tmp.json modify.json