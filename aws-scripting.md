1. Install EC2 tools: `sudo apt-get ec2-api-tools`
2. Check this script for starting + logging onto EC2 instance https://gist.github.com/CerebralMastication/959780

SSH-ing into the instance: Private key file must be used with chmod 400, see instructions here: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AccessingInstances.html

--> When getting permission error, execute `chmod 400 mykey.pem`
also see http://stackoverflow.com/questions/8193768/trying-to-ssh-into-an-amazon-ec2-instance-permission-error

git pull origin master
python manage.py migrate

# AWS Keys best practices
http://docs.aws.amazon.com/general/latest/gr/aws-access-keys-best-practices.html



# DigitalOcean resources on Ubuntu server management
## Initial server setup
https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-14-04
## Additional steps to take to protect the instance
https://www.digitalocean.com/community/tutorials/additional-recommended-steps-for-new-ubuntu-14-04-servers

## Introduction to ec2 scripting
https://blogs.esri.com/esri/arcgis/2010/10/20/introduction-to-scripting-with-amazon-ec2/

## AWS tutorial on setting up LAMP stack on Amazon Linux
http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/install-LAMP.html

## AWS tutorial on aws command line interface 
https://aws.amazon.com/cli/

## AWS tutorial on auto scaling 
http://docs.aws.amazon.com/autoscaling/latest/userguide/WhatIsAutoScaling.html

## Launching instances AWS manual 
http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/launching-instance.html#launch-instance-console

## Running commands on Linux AWS tutorial
http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html

## AWS Sample code and libraries
https://aws.amazon.com/code

## Running shell scripts using EC2 Run Command
http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/remote-commands-shellcript.html

## AWS EC2 Reference API
http://docs.aws.amazon.com/AWSEC2/latest/APIReference/Welcome.html

## Remotely Manage Linux Instances using Run Command
http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/execute-remote-commands.html

## EC2 and Amazon Virutal private cloud AWS tutorial 
http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-vpc.html

## Elastic IP addresses basics
http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html

## Amazon EC2 security groups for linux instances AWS tutorial
http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html

## AWS tutorial: Amazon EC2 Key Pairs
http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html

## Instances and AMI Aws tutorial
http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instances-and-amis.html

