#!/bin/bash
# THIS SCRIPT IS STOLEN FROM https://gist.github.com/CerebralMastication/959780

secGroup="launch-wizard-3"
ami="ami-8504fdea"
keyName="test"
keyLocation="~/.ssh/perspem.pem"

instance_id=$(ec2-run-instances -k $keyName -g $secGroup -t t2.micro $ami | awk '/INSTANCE/{print $2}')
echo $instance_id

sleep 30

name=$(ec2-describe-instances $instance_id | awk '/INSTANCE/{print $4}')
echo $name

ssh -i $keyLocation  ubuntu@$name -o StrictHostKeyChecking=no
