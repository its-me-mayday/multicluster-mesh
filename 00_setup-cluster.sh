#!/bin/bash

kind create cluster --name cluster1 --config kind.config.k8s.yaml
kind create cluster --name cluster2 --config kind.config.k8s.yaml

kind get clusters
