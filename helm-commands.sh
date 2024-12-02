#!/bin/bash

# Basic Helm Commands for Create, Install, Uninstall, and Upgrade

# Create a New Helm Chart
# Usage: helm create <chart_name>
# Example: Create a new Helm chart named mychart
helm create mychart

# Install a Helm Chart
# Usage: helm install <release_name> <chart_name> [flags]
# Example: Install the MySQL chart from the stable repository
helm install my-release stable/mysql

# Uninstall a Release
# Usage: helm uninstall <release_name> [flags]
# Example: Uninstall the release named my-release
helm uninstall my-release

# Upgrade a Release
# Usage: helm upgrade <release_name> <chart_name> [flags]
# Example: Upgrade the my-release with a new version of MySQL
helm upgrade my-release stable/mysql

helm upgrade --install --force vproifle-stack helm/vprofilecharts --set appimage=${registry}:${BUILD_NUMBER} --namespace prod

helm create vprofilecharts
kubectl create ns test
helm install --namespace test vproifle-stack helm/vprofilecharts --set appimage=kubeanas/projectapp
