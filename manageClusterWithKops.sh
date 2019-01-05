#!/bin/sh
echo "Managing clusters with Kops"

# Define variables
AWS_ACCESS_KEY_ID=$1
AWS_SECRET_ACCESS_KEY=$2
REGION="us-east-2"
OUTPUT="json"


ValidateCluster()
{
    kops validate cluster --name value-source-cloud.com --state s3://valuesource-kubernetes
}


if [ -z $AWS_ACCESS_KEY_ID ]
then
    echo "Please pass the AWS_ACCESS_KEY_ID."
    exit 2
elif [ -z $AWS_SECRET_ACCESS_KEY ]
then
    echo "Please pass the AWS_SECRET_ACCESS_KEY."
    exit 2
fi

echo Configuring AWS...
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set region $REGION
aws configure set output $OUTPUT

ValidateCluster
RETURN_VALUE = $? 

echo $RETURN_VALUE

RETURN 0
                