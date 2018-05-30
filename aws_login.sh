#!/usr/bin/env bash
echo "Start logging in ECS"
mkdir ~/.aws;
curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py";
python get-pip.py;
pip install awscli --ignore-installed six;
echo "[default]\naws_access_key_id=$AWS_ACCESS_KEY_ID\naws_secret_access_key=$AWS_SECRET_ACCESS_KEY" > ~/.aws/credentials;
echo "[default]\nregion=$AWS_ECR_REGION" > ~/.aws/config;
login_string=`/usr/bin/aws ecr get-login --no-include-email --region us-east-1`;
eval $login_string;
