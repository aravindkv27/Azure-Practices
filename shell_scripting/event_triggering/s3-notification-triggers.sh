#!/bin/bash

set -x

# Store AWS account ID in a variable
account_id=$(aws sts get-caller-identity --query 'Account' --output text)

echo "AWS Account ID: $account_id"


# Set AWS region and bucket name
aws_region="us-east-1"
bucket_name="aravind-bucker-trigger"
lambda_func_name="s3-lambda-function"
role_name="s3-lambda-sns-aravind"
email_address="kvaravind27@gmail.com"

# create IAM Role for the project
role_response=$(aws iam create-role --role-name s3-lambda-sns-aravind --assume-role-policy-document '{
  "Version": "2012-10-17",
  "Statement": [{
    "Action": "sts:AssumeRole",
    "Effect": "Allow",
    "Principal": {
      "Service": [
         "lambda.amazonaws.com",
         "s3.amazonaws.com",
         "sns.amazonaws.com"
      ]
    }
  }]
}')

# Extract the role ARN from the JSON response and store it in a variable
role_arn=$(echo "$role_response" | jq -r '.Role.Arn')

# Print the role ARN
echo "Role ARN: $role_arn"