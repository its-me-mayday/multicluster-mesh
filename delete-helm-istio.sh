#!/bin/bash

kubectl config use-context kind-cluster1
helm uninstall --namespace istio-system istiod
#helm uninstall --namespace istio-system istio-base

kubectl config use-context kind-cluster2
helm uninstall --namespace istio-system istiod
#helm uninstall --namespace istio-system istio-base

# Restabilish cmd from first cluster
kubectl config use-context kind-cluster1
