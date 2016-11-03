#!/bin/bash

#eval "$(ssh-agent -s)"
#echo "$DEPLOY_KEY" > deploy_key.pem
#chmod 600 deploy_key.pem
#ssh-add deploy_key.pem
git remote add live ssh://ubuntu@ec2-54-229-70-158.eu-west-1.compute.amazonaws.com/repo/site.git
git push live master
