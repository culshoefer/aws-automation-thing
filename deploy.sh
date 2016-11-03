#!/bin/bash

aws deploy push --application-name RefManager --s3-location s3://refmanager-codedeploy --source .
