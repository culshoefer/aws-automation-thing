#!/bin/bash

aws elasticbeanstalk create-application --application-name RefManager --description "Our application for scenario week 3"

aws deploy create-deployment-group --application-name RefManager --deployment-config-name CodeDeployDefault.OneAtATime --deployment-group-name Staging
