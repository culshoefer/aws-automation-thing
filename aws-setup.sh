#!/bin/bash

#VPC_NAME="$1"
#CIDR="$2"
VPC_SUBNET="$1"

function createLaunchConfiguration {
    aws autoscaling create-launch-configuration --launch-configuration-name DefaultRefmanagerConf --image-id ami-f9619996 --instance-type t2.nano
}

function createAutoScalingGroup {
    if [ -z "$1" ]; then
	exit 1
    fi
    aws autoscaling create-auto-scaling-group --auto-scaling-group-name $1 --min-size 1 --desired-capacity 2 --max-size 5 --launch-configuration-name DefaultRefmanagerConf --vpc-zone-identifier $VPC_SUBNET
}

aws s3 mb s3://refmanager-codedeploy

#aws elasticbeanstalk create-application --application-name RefManager --description "Our application for scenario week 3"

aws deploy create-application --application-name RefManager

#aws ec2 create-subnet --vpc-id $VPC_NAME --cidr-block $CIDR

createLaunchConfiguration

SERVICE_ROLE_ARN="$(aws iam create-role --role-name CodeDeployServiceRole --assume-role-policy-document file://codedeployrole.json)"
echo "Service role: $SERVICE_ROLE_ARN"

SERVICE_ROLE_ARN="$(aws iam get-role --role-name CodeDeployServiceRole --query "Role.Arn" --output text)"

createAutoScalingGroup autoScaleStaging

aws deploy create-deployment-group --application-name RefManager --deployment-config-name CodeDeployDefault.OneAtATime --deployment-group-name Staging --auto-scaling-groups autoScaleStaging --service-role-arn $SERVICE_ROLE_ARN
