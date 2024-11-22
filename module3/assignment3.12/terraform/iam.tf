resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda_exec_role"

  # Define the trust policy to allow Lambda to assume the role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

# Define inline policy to allow Lambda function to publish to SNS topic
# This is a mandatory res for dead letter queue functionality
resource "aws_iam_role_policy" "sns_publish_policy" {
  name = "SNSPublishPolicy"
  role = aws_iam_role.lambda_exec_role.name

  # Specify the policy document to grant necessary permissions
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow",
        Action   = "sns:Publish",
        Resource = aws_sns_topic.lambda_dead_letter_topic.arn
      }
    ]
  })
}



# Attached AWS managed policy for basic Lambda execution permission
resource "aws_iam_role_policy_attachment" "name" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
