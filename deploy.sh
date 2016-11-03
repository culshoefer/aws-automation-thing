#!/bin/bash

cd
ls
cd aws-automation-thing
echo "Now running ssh agent"
eval "$(ssh-agent -s)"
echo "$DEPLOY_KEY" > .travis/deploy_key.pem
chmod 600 .travis/deploy_key.pem
echo "Now adding key"
ssh-add .travis/deploy_key.pem
echo "Now adding remote"
git remote add live ssh://ubuntu@ec2-54-229-70-158.eu-west-1.compute.amazonaws.com/home/ubuntu/repo/site.git
echo "Now pushing"
git push live master
exit 0
