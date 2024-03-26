resource "aws_lambda_function" "ec2-stop-start" {
  filename      = "lambda.zip"
  function_name = var.function_name
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda.lambda_handler"
  source_code_hash = filebase64sha256("lambda.zip")

  runtime = "python3.12"
  timeout = 60
}