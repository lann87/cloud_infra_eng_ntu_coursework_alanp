resource "aws_lambda_function" "ap-lambda-fn" {
  #checkov:skip=CKV_AWS_117:Ensure that AWS Lambda function is configured inside a VPC
  function_name = "ap-lambda-function-6nov"
  runtime       = "python3.10"
  role          = aws_iam_role.lambda_exec_role.arn
  handler       = "lambda_function.lambda_handler"

  # Configure code signing for additional security
  code_signing_config_arn = aws_lambda_code_signing_config.ap-lambda-codesigning.arn

  # Set max number of concurrent executions
  reserved_concurrent_executions = 50

  # Configure dead letter queue for failed invocations
  dead_letter_config {
    target_arn = aws_sns_topic.lambda_dead_letter_topic.arn
  }

  # Enable active tracing for better obervability
  tracing_config {
    mode = "Active"
  }

  # Specify location of the lambda function code
  filename         = "${path.module}/../python/lambda_function.zip"
  source_code_hash = filebase64sha256("${path.module}/../python/lambda_function.zip")
}

# Creating code signing configuration for the lambda function
resource "aws_lambda_code_signing_config" "ap-lambda-codesigning" {
  allowed_publishers {
    signing_profile_version_arns = [aws_signer_signing_profile.ap-lambda-signerprof.arn]
  }
}

# Creating a signing profile for the lambda function
resource "aws_signer_signing_profile" "ap-lambda-signerprof" {
  name_prefix = "apsigner"
  platform_id = "AWSLambda-SHA384-ECDSA"
}

# Creating SNS topic for the lambda function's dead letter queue
resource "aws_sns_topic" "lambda_dead_letter_topic" {
  name              = "lambda-dead-letter-topic"
  kms_master_key_id = "alias/aws/sns"
}