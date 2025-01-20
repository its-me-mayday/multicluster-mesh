#!/bin/bash

# install istio/base
helm install istio-base istio/base -n istio-system --wait --kube-context=kind-cluster1
helm install istio-base istio/base -n istio-system --wait --kube-context=kind-cluster2

## install istio/istiod
helm install istiod istio/istiod -f ./cluster1/cluster.yaml -n istio-system --wait --kube-context=kind-cluster1
helm install istiod istio/istiod -f ./cluster2/cluster.yaml -n istio-system --wait --kube-context=kind-cluster2

## install istio/gateway
helm install istio-ingressgateway istio/gateway -f ./cluster1/ew-gateway.yaml -n istio-system --wait --kube-context=kind-cluster1
helm install istio-ingressgateway istio/gateway -f ./cluster2/ew-gateway.yaml -n istio-system --wait --kube-context=kind-cluster2
