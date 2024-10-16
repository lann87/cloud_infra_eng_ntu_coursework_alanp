import json
import boto3
import uuid

dynamodb = boto3.resource('dynamodb',region_name='ap-southeast-1')
table = dynamodb.Table('Notes')


def create_note(event, context):
    print(event)
    data = json.loads(event['body'])
    note = {
        'id': data['id'],
        'content': data['content'],
        'createdAt': str(data['createdAt'])
    }

    table.put_item(Item=note)

    response = {
        'statusCode': 200,
        'body': json.dumps(note)
    }
    return response


def get_notes(event, context):
    result = table.scan()

    response = {
        'statusCode': 200,
        'body': json.dumps(result['Items'])
    }
    return response


def get_note_by_id(event, context):
    note_id = event['pathParameters']['id']
    print(note_id)
    result = table.get_item(Key={'id': note_id})
    print(result)
    response = {
        'statusCode': 200,
        'body': json.dumps(result['Item'])
    }
    return response


def update_note(event, context):
    note_id = event['pathParameters']['id']
    data = json.loads(event['body'])

    table.update_item(
        Key={'id': note_id},
        UpdateExpression='SET content = :content',
        ExpressionAttributeValues={':content': data['content']}
    )

    response = {
        'statusCode': 200,
        'body': json.dumps({'message': 'Note updated'})
    }
    return response


def delete_note(event, context):
    note_id = event['pathParameters']['id']

    table.delete_item(Key={'id': note_id})

    response = {
        'statusCode': 200,
        'body': json.dumps({'message': 'Note deleted'})
    }
    return response
