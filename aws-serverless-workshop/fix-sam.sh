cd ~/environment

wget https://ws-assets-prod-iad-r-iad-ed304a55c2ca1aee.s3.us-east-1.amazonaws.com/76bc5278-3f38-46e8-b306-f0bfda551f5a/module2/sam-python/sam-cookiecutter-2023-09-18.zip

unzip sam-cookiecutter-2023-09-18.zip 

echo '{"project_name": "ServerlessWorkshop", "runtime": "python3.9", "architectures": {"value": ["x86_64"]}}' > ./start_state/cookiecutter.json

sam init --name "ws-serverless-patterns" --location ./start_state/

#https://catalog.workshops.aws/serverless-patterns/en-US/business-scenario