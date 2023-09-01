import boto3

ec2 = boto3.client('ec2')

res = ec2.describe_instances(
     
)
print(res)