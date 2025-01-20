#!/bin/bash

# apply namespace in cluster1 and cluster2
kubectl apply -f cluster1/namespace.yaml --context=kind-cluster1
kubectl apply -f cluster2/namespace.yaml --context=kind-cluster2
