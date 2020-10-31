#!/bin/bash
set -e

# Packer checks
packer validate -var-file=packer/variables.json.example packer/db.json
packer validate -var-file=packer/variables.json.example packer/app.json
packer validate -var-file=packer/variables.json.example packer/ubuntu16.json
packer validate -var-file=packer/variables.json.example packer/immutable.json
# Terraform checks
pushd terraform/prod
terraform get && terraform init -backend=false && terraform validate
tflint ./
popd
pushd terraform/stage
terraform get && terraform init -backend=false && terraform validate
tflint ./
popd
pushd ./ansible
ansible-lint -v ansible/playbooks/*.yml
popd
