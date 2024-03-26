resource "aws_cloudwatch_event_rule" "start-ec2" {
    name = var.start_rule_name
    description = var.event_rule_des1
    schedule_expression = var.start_cron
}
resource "aws_cloudwatch_event_rule" "stop-ec2" {
    name = var.stop_rule_name
    description = var.event_rule_des2
    schedule_expression = var.stop_cron
}
resource "aws_cloudwatch_event_target" "sgp-uat-lbd-start-ec2" {
    arn = aws_lambda_function.ec2-stop-start.arn
    rule = aws_cloudwatch_event_rule.start-ec2.name
    input = <<JSON
    {
        "operation":"start"
    }
JSON
}
resource "aws_cloudwatch_event_target" "sgp-uat-lbd-stop-ec2" {
    arn = aws_lambda_function.ec2-stop-start.arn
    rule = aws_cloudwatch_event_rule.stop-ec2.name
    input = <<JSON
    {
        "operation":"stop"
    }
JSON
}
resource "aws_lambda_permission" "start-permission" {
    action = "lambda:InvokeFunction"
    function_name = aws_lambda_function.ec2-stop-start.arn
    principal = "events.amazonaws.com"
    source_arn = aws_cloudwatch_event_rule.start-ec2.arn
}
resource "aws_lambda_permission" "stop-permission" {
    action = "lambda:InvokeFunction"
    function_name = aws_lambda_function.ec2-stop-start.arn
    principal = "events.amazonaws.com"
    source_arn = aws_cloudwatch_event_rule.stop-ec2.arn
}