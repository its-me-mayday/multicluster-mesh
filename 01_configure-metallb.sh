#!/bin/bash

# inspect network
docker network inspect -f '{{.IPAM.Config}}' kind

# apply metallb in cluster1 and cluster2
kubectl apply -f cluster1/metallb.yaml --context=kind-cluster1
kubectl apply -f cluster2/metallb.yaml --context=kind-cluster2
