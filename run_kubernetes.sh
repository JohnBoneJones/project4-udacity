#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=bigpolarbear/project-4

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deploy project-4 --image=$dockerpath:latest

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
pod=$(kubectl get pods --no-headers -o custom-columns=':metadata.name')
echo $pod
kubectl port-forward pods/$pod 8000:80