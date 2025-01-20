#!/bin/bash

# install istio/base
#helm install istio-base istio/base -n istio-system --wait --kube-context=kind-cluster1
#helm install istio-base istio/base -n istio-system --wait --kube-context=kind-cluster2

# install istio/istiod
helm install istiod istio/istiod -f ./cluster1/cluster.yaml -n istio-system --wait --kube-context=kind-cluster1
helm install istiod istio/istiod -f ./cluster2/cluster.yaml -n istio-system --wait --kube-context=kind-cluster2
