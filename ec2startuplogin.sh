#!/bin/bash
# THIS SCRIPT IS STOLEN FROM https://gist.github.com/CerebralMastication/959780

secGroup="sg-50681d39"
ami="ami-1aad5273"
keyName="ec2ApiTools"
keyLocation="/home/jal/Documents/AWS/ec2ApiTools_rsa_id"

instance_id=$(ec2-run-instances -k $keyName -g $secGroup -t m1.large $ami | awk '/INSTANCE/{print $2}')
echo $instance_id

sleep 30

name=$(ec2-describe-instances $instance_id | awk '/INSTANCE/{print $4}')
echo $name

ssh -i $keyLocation  ubuntu@$name -o StrictHostKeyChecking=no
