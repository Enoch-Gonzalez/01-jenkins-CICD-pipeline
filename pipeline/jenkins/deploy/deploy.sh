#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

# Transfering files using ssh
scp -i /opt/prod /tmp/.auth <your-vm-user>@l<your-vm-ip>:/tmp/.auth
scp -i /opt/prod ./jenkins/deploy/publish <your-vm-user>@l<your-vm-ip>:/tmp/publish
ssh -i /opt/prod <your-vm-user>@l<your-vm-ip> "/tmp/publish"