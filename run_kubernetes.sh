#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=tanquyvt/udacity-api

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deploy udacity-api --image=tanquyvt/udacity-api:api-v1

# Step 3:
# List kubernetes pods
kubectl get pods
pod_name=`kubectl get pod --field-selector status.phase=Running --output name`
echo "Pod name: " $pod_name

# Step 4:
# Forward the container port to a host
kubectl port-forward $pod_name --address 0.0.0.0 8000:80
