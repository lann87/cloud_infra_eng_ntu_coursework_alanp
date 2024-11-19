import json
import random
import time
from datetime import datetime

def lambda_handler(event, context):    # Changed from handler to lambda_handler
    # Simulate some processing time (0-1 seconds)
    time.sleep(random.random())
    
    # Generate random success/error responses (90% success rate)
    if random.random() < 0.9:
        return {
            'statusCode': 200,
            'body': json.dumps({
                'message': 'Success! HUAT AH!',
                'timestamp': datetime.now().isoformat()
            })
        }
    else:
        raise Exception('Simulated error')