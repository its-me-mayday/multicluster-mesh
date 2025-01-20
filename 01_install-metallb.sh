#!/bin/bash

# install metallb (kubernetes bare metal cluster) by manifest
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.9/config/manifests/metallb-native.yaml --context=kind-cluster1
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.9/config/manifests/metallb-native.yaml --context=kind-cluster2
