#!/bin/bash



cd ceph-cluster
terraform init
terraform apply -auto-approve
echo "go to ceph1 ssh ro other server"
sleep 20
ansible-playbook -i inventory/hosts.ini playbook.yml  --ask-vault-pass
