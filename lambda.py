import boto3
import os

def lambda_handler(event, context):
  ec2 = boto3.client('ec2')
  tag_name = os.environ['Key']
  tag_value = os.environ['Value']

  # Handle missing operation gracefully
  operation = event.get('operation', None)
  if not operation:
    print('No operation detected in the event')
    return {'statusCode': 200, 'body': 'Operation completed'}

  # Ensure operation is valid (start/stop)
  if operation.lower() not in ['start', 'stop']:
    print('Invalid operation provided')
    return {'statusCode': 400, 'body': 'Operation must be start or stop'}

  try:
    # Filter instances based on tags
    filters = [{'Name': f'tag:{tag_name}', 'Values': [tag_value]}]
    response = ec2.describe_instances(Filters=filters)

    instance_ids = [reservation['Instances'][0]['InstanceId'] for reservation in response['Reservations']]

    # Perform chosen operation (start or stop)
    if operation == 'start':
      ec2.start_instances(InstanceIds=instance_ids)
      print(f'Started instances: {instance_ids}')
    else:
      ec2.stop_instances(InstanceIds=instance_ids)
      print(f'Stopped instances: {instance_ids}')
  except Exception as e:
    print(f'Error during {operation} operation: {e}')

  return {'statusCode': 200, 'body': 'Operation completed'}
