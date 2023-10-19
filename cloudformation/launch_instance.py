import boto3
import os

region = os.environ["REGION"]
print("Region: " + region)

instances = ['i-02dfb61bdb0d56e17']

ec2 = boto3.client('ec2', region_name=region)

def lambda_handler(event, context):
  response = ec2.describe_instances(Filters=[
    {
        'Name': 'instance-state-name',
        'Values': [
            'stopped',
            'running'
        ],
    },
  ],
  InstanceIds=instances
  )
  print('The instance was ' + response['Reservations'][0]['Instances'][0]['State']['Name'])
  action = ''
  if response['Reservations'][0]['Instances'][0]['State']['Name'] == 'running':
    ec2.stop_instances(InstanceIds=instances)
    action = 'stopped'
  if response['Reservations'][0]['Instances'][0]['State']['Name'] == 'stopped':
    ec2.start_instances(InstanceIds=instances)
    action = 'started'
  print('Instance ' + instances[0] + ' is ' + action)  
  return 'Instance ' + instances[0] + ' is ' + action