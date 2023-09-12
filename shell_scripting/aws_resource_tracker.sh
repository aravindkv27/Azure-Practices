#!/bin/bash

#####
# Author: Aravind
# Date: August 29
#
# version : A1
#
# AWS Resource Usage
#####

## set puts this script to debug mode.
set -x

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users

# List S3 Buckets
echo "List of S3 Buckets"
aws s3 ls

# list ec2 instance
echo "List of EC2 Instance"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

# List lambda
echo "List of Lambda functions"
aws lambda list-functions

# list Iam Users
echo "List of IAM users"
aws  iam list-users
