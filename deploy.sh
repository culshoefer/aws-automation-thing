#!/bin/bash

aws deploy create-deployment --application-name RefManager --s3-location bucket=refmanager-codedeploy,key=latest.zip,bundleType=zip,eTag="222e72bae53411c41c8f177014660343-5" --deployment-group-name Staging --description "Staging deploy from AWS CLI"
