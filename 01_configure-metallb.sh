#!/bin/bash

# inspect network
docker network inspect -f '{{.IPAM.Config}}' kind

# apply metallb in cluster1 and cluster2
kubectl apply -f metallb.cluster1.yaml --context=kind-cluster1
kubectl apply -f metallb.cluster2.yaml --context=kind-cluster2
