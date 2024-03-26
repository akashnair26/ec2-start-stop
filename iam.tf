resource "aws_iam_role" "lambda_role" {
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
    tags = {
    Name = "lambda_role"
  }
}

resource "aws_iam_policy" "lambda_policy" {
  policy = jsonencode({
    Version = "2012-10-17"
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*"
    },
    {
      "Effect": "Allow",
      "Action": [
        # "ec2:DescribeInstances",
        "ec2:Describe*",
        "ec2:Start*",
        "ec2:Stop*"
      ],
      "Resource": "*"
    }
  ]
  })
    tags = {
    Name = "lambda_policy"
  }
}

resource "aws_iam_role_policy_attachment" "lambda-ec2-policy-attach" {
  policy_arn = aws_iam_policy.lambda_policy.arn
  role = aws_iam_role.lambda_role.name
}