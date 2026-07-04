#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update -qq 2>/dev/null
apt-get install -y -qq unzip curl docker.io 2>/dev/null
systemctl enable docker 2>/dev/null
systemctl start docker 2>/dev/null

curl -sS https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o /tmp/awscliv2.zip
unzip -oq /tmp/awscliv2.zip -d /tmp 2>/dev/null
/tmp/aws/install --update 2>/dev/null
rm -rf /tmp/awscliv2.zip /tmp/aws

docker --version
aws --version