#!/bin/bash
# user-data.sh
#
# EC2 bootstrap script — installs Docker + Docker Compose and brings up
# the source databases (MySQL + Postgres) defined in ../docker/docker-compose.yml
#
# Referenced from Terraform: part3-ingestion-glue/infra/terraform/ec2.tf
#
# STATUS: skeleton only — needs testing on Amazon Linux 2023.

set -e

# TODO: verify package manager commands for the chosen AMI (Amazon Linux 2023 assumed)
dnf update -y
dnf install -y docker git

systemctl enable docker
systemctl start docker

# Install Docker Compose plugin
# TODO: pin a specific version
mkdir -p /usr/local/lib/docker/cli-plugins
curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 \
  -o /usr/local/lib/docker/cli-plugins/docker-compose
chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

# TODO: pull docker-compose.yml + init scripts onto the instance.
# Options: bake into an AMI, clone this repo, or use Terraform's
# file provisioner / S3 to copy them over. Placeholder approach below
# assumes the repo gets cloned onto the instance.
#
# git clone <your-repo-url> /opt/datalake-iceberg-aws-series
# cd /opt/datalake-iceberg-aws-series/workshop-hands-on/docker
# docker compose up -d

echo "user-data.sh bootstrap complete (placeholder — see TODOs)"
