#!/bin/bash

yum update -y
yum install -y docker

systemctl enable docker
systemctl start docker

usermod -a -G docker ec2-user # Só funciona após logout/login, então pode não ter efeito imediato.

docker run -p 80:8080 melvintivane/public-api:latest
