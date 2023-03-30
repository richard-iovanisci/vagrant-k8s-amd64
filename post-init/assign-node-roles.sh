#!/bin/bash

# Get the list of nodes excluding the control-plane node
NODES=$(kubectl get nodes --selector='!node-role.kubernetes.io/control-plane' -o jsonpath='{.items[*].metadata.name}')

# Label each node as a worker
for NODE in $NODES; do
  kubectl label node $NODE node-role.kubernetes.io/worker=""
done

# Show updated node list
kubectl get nodes
