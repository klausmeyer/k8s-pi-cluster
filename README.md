# k8s-pi-cluster

## Intro

This repository is used to manage a small raspberry-pi based kubernetes cluster I am running as a pet-project in my "homelab".

![Pi Cluster](https://github.com/user-attachments/assets/bccca540-ec7c-4e57-96d1-ee376656ec6c)

## Repo Structure

Each namespace in the cluster is represented by a helm-chart with the same name inside the `deployments` directory.

The helm-charts are mainly just small wrappers around other public available helm-charts and include values and ([sealed](https://github.com/bitnami-labs/sealed-secrets)) secrets used to install them on the cluster.

## Updates

Updates are automated via [Renovate](https://www.mend.io/renovate/).

## Automation

Deployments are triggered via GitHub actions and performed by a private runner hosted on one of the raspberry-pis.

The action itself executes `bin/deploy.sh` and passed the namespace/helm-chart to deploy.
