sam package \
    --template-file simple-chat-app.yml \
    --output-template-file packaged.yaml \
    --s3-bucket cf-templates-674ip9otnbue-us-east-1

sam deploy \
    --template-file packaged.yaml \
    --stack-name simple-websocket-chat-app \
    --capabilities CAPABILITY_IAM \
    --parameter-overrides MyParameterSample=MySampleValue

aws cloudformation describe-stacks \
    --stack-name simple-websocket-chat-app --query 'Stacks[].Outputs'