#!/bin/bash
RETRY=0 #A
STATUS="kubectl rollout status deployment.v1.apps/frontend"  #B
until $STATUS || [ $RETRY -eq 120 ]; do  #C
  $STATUS   #D
  RETRY=$((RETRY + 1))  #E
  sleep 10  #F
done

