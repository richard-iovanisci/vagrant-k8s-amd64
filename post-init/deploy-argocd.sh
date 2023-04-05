#!/bin/bash

# install argocd
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# create service and get details
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort", "ports": [{"port": 80,"nodePort": 32080,"name": "http"},{"port": 443,"nodePort": 32443,"name": "https"}]}}'
kubectl get svc -n argocd

# get password for 'admin' account -- can be changes later to something like 'argoAdmin123$'
#kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

# for custom base path for UI add the following to the argocd-server deployment
#- command:
#        - argocd-server
#        - --basehref # add this line
#        - /argo # add this line