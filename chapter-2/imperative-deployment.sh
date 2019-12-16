#!/bin/sh
kubectl create deployment nginx-imperative --image=nginx:latest   #A
kubectl scale deployment/nginx-imperative --replicas 3            #B
kubectl annotate deployment/nginx-imperative environment=prod     #C
kubectl annotate deployment/nginx-imperative organization=sales   #D

