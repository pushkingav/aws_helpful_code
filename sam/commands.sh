# create an s3 bucket
aws s3 mb s3://ap-code-sam-bucket

# package cloudformation
aws cloudformation package  --s3-bucket ap-code-sam-bucket --template-file template.yaml --output-template-file gen/template-generated.yaml
# sam package ... 

# deploy 
aws cloudformation deploy --template-file gen/template-generated.yaml --stack-name hello-world-sam --capabilities CAPABILITY_IAM