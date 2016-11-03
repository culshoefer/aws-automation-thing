#!/bin/bash
zip -r latest * --quiet
mkdir -p rdy4deploy_ref_manager
mv latest.zip rdy4deploy_ref_manager/latest.zip
aws iam list-roles
aws deploy list-applications
