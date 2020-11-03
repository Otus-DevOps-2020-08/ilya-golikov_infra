#!/bin/bash
set -e

# Packer checks
packer validate -var-file=packer/variables.json.example packer/db.json
packer validate -var-file=packer/variables.json.example packer/app.json
packer validate -var-file=packer/variables.json.example packer/ubuntu16.json
packer validate -var-file=packer/variables.json.example packer/immutable.json
# Terraform checks
pushd terraform/prod
mv backend.tf backend.back
terraform get && terraform init -backend=false && terraform validate
tflint ./
mv backend.back backend.tf
popd
pushd terraform/stage
mv backend.tf backend.back
terraform get && terraform init -backend=false && terraform validate
tflint ./
mv backend.back backend.tf
popd
pushd ./ansible
ansible-lint -v playbooks/*.yml --exclude=roles/jdauphant.nginx
popd
