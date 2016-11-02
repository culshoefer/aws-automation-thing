#!/bin/bash

# Created with EC2 best practices in mind http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-best-practices.html

echo "Creating S3 packaging bucket"

aws s3 rb s3://refmanager-codedeploy
aws s3 ls

echo "S3 packaging bucket created"

# Potentially you need to execute the following before: 
# aws iam create-role --role-name CodeDeployServiceRole --assume-role-policy-document file://codedeployrole.json
# Note that the role is in .gitignore
SERVICE_ROLE_ARN="$(aws iam get-role --role-name CodeDeployServiceRole --query "Role.Arn" --output text"
)"
echo $SERVICE_ROLE_ARN

function createLaunchConfiguration {
    aws autoscaling create-launch-configuration --launch-configuration-name DefaultRefmanagerConf --image-id ami-f9619996
}

function createAutoScalingGroup {
    SCALING_GROUP_NAME = $1
    if [ -z "$SCALING_GROUP_NAME" ]; then
	exit 1
    fi
    aws autoscaling create-auto-scaling-group --auto-scaling-group-name $SCALING_GROUP_NAME --min-size 1 --desired-capacity 2 --max-size 5 --launch-configuration-name DefaultRefmanagerConf
}

echo "Creating staging scaling group"
createAutoScalingGroup Staging 

echo "Creating staging security group"
aws create-security-group --application-name RefManager --deployment-group-name RefManagerStaging --deployment-config-name CodeDeployDefault.OneAtATime

#We only want to deploy to one production server at a time --> maximise uptime
#echo "Creating production security group"
#aws create-security-group --application-name RefManager --deployment-group-name RefManagerProduction --deployment-config-name CodeDeployDefault.OneAtATime --server-role-arn $SERVICE_ROLE_ARN 

