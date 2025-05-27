#!/bin/bash

helm upgrade -i internal-issue-report-apiv1 bitnami/nginx \
  --namespace mercury \
  --create-namespace \
  --version 13.0.0

helm upgrade -i internal-issue-report-apiv2 bitnami/nginx \
  --namespace mercury \
  --create-namespace \
  --version 13.0.0
  
helm upgrade -i internal-issue-report-app bitnami/nginx \
  --namespace mercury \
  --create-namespace \
  --version 13.0.0
  
helm upgrade -i internal-issue-report-test /tmp/helm/internal-issue-report-test  \
  --namespace mercury \
  --create-namespace \
  --wait &