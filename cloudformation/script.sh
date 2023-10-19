#https://dev.classmethod.jp/articles/cloudformation-template-for-vpc-with-ec2-and-alb/
$ subnetId1=$(aws ec2 describe-subnets --filters "Name=availability-zone,Values=us-east-1a" --query "Subnets[*].SubnetId" --output text)
$ subnetId2=$(aws ec2 describe-subnets --filters "Name=availability-zone,Values=us-east-1b" --query "Subnets[*].SubnetId" --output text)
$ subnetId3=$(aws ec2 describe-subnets --filters "Name=availability-zone,Values=us-east-1c" --query "Subnets[*].SubnetId" --output text)

$ default_vpc_id=$(aws ec2 describe-vpcs \
    --filters Name=isDefault,Values=true \
    --query 'Vpcs[*].VpcId' \
    --output text)

$ echo ${default_vpc_id}

aws cloudformation create-stack \
  --stack-name myteststack \
  --template-body file:///home/cloudshell-user/3-ec2-elb.yaml \
  --parameters ParameterKey=VPCID,ParameterValue=$default_vpc_id ParameterKey=PublicSubnets,ParameterValue=$subnetId1\\,$subnetId2\\,$subnetId3

aws cloudformation deploy --template-file 3-ec2-elb.yaml --stack-name ROUTE53-TEST-STACK --capabilities CAPABILITY_NAMED_IAM