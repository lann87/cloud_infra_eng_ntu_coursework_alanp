import json
import boto3

def lambda_handler(event, context):
    notification = 'Good day, {}!! I cannot wait to go to {} for my holidays in {}!!'.format(event['name'], event['city'], event['month'])
    print(notification)
    return {
        'statusCode': 200,
        'body': json.dumps(notification)
    }