#!/bin/bash

helm install istio-base istio/base -n istio-system --wait --kube-context=kind-cluster1
helm install istio-base istio/base -n istio-system --wait --kube-context=kind-cluster2
