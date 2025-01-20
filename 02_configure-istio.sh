#!/bin/bash

# apply namespace in cluster1 and cluster2
kubectl apply -f cluster1/namespace.yaml --context=kind-cluster1
kubectl apply -f cluster2/namespace.yaml --context=kind-cluster2

# apply secrets (kind-cluster1)
kubectl create secret generic cacerts -n istio-system \
     --from-file=../istio-1.24.2/certs/cluster1/ca-cert.pem \
     --from-file=../istio-1.24.2/certs/cluster1/ca-key.pem \
     --from-file=../istio-1.24.2/certs/cluster1/root-cert.pem \
     --from-file=../istio-1.24.2/certs/cluster1/cert-chain.pem --context=kind-cluster1

# apply secrets (kind-cluster2)
kubectl create secret generic cacerts -n istio-system \
     --from-file=../istio-1.24.2/certs/cluster2/ca-cert.pem \
     --from-file=../istio-1.24.2/certs/cluster2/ca-key.pem \
     --from-file=../istio-1.24.2/certs/cluster2/root-cert.pem \
     --from-file=../istio-1.24.2/certs/cluster2/cert-chain.pem --context=kind-cluster2
