#!/bin/bash

# expose services
kubectl apply -n istio-system -f ./cluster1/gateway.yaml --context=kind-cluster1
kubectl apply -n istio-system -f ./cluster2/gateway.yaml --context=kind-cluster2
