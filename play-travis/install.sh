#!/bin/bash
set -e

# install packer
curl -L "https://releases.hashicorp.com/packer/1.6.1/packer_1.6.1_linux_amd64.zip" -o /tmp/packer.zip
unzip -d ~/bin /tmp/packer.zip
# install terraform
curl -L "https://releases.hashicorp.com/terraform/0.12.28/terraform_0.12.28_linux_amd64.zip" -o /tmp/terraform.zip
unzip -d ~/bin /tmp/terraform.zip
# install tflint
curl -L "https://github.com/terraform-linters/tflint/releases/download/v0.20.3/tflint_linux_amd64.zip" -o /tmp/tflint.zip
unzip -d ~/bin /tmp/tflint.zip
# install ansible lint
pip install ansible-lint
