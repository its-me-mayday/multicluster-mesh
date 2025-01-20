#!/bin/bash

# create namespace
kubectl create namespace istio-sample --context=kind-cluster1
kubectl create namespace istio-sample --context=kind-cluster2

# setup label istio-injection
kubectl label ns istio-sample istio-injection=enabled --context=kind-cluster1
kubectl label ns istio-sample istio-injection=enabled --context=kind-cluster2

# install helloworld (services) in both clusters
kubectl apply -f ./samples/helloworld.yaml -l service=helloworld -n istio-sample --context=kind-cluster1
kubectl apply -f ./samples/helloworld.yaml -l service=helloworld -n istio-sample --context=kind-cluster2

# install helloworld (deployments) in both clusters
kubectl apply -f ./samples/helloworld.yaml -l version=v1 -n istio-sample --context=kind-cluster1
kubectl apply -f ./samples/helloworld.yaml -l version=v2 -n istio-sample --context=kind-cluster2

kubectl apply -f ./samples/sleep.yaml -n istio-sample --context=kind-cluster1
kubectl apply -f ./samples/sleep.yaml -n istio-sample --context=kind-cluster2

# setup loadbalancer
kubectl patch svc helloworld -n istio-sample -p '{"spec":{"type":"LoadBalancer"}}' --context kind-cluster1
kubectl patch svc helloworld -n istio-sample -p '{"spec":{"type":"LoadBalancer"}}' --context kind-cluster2
