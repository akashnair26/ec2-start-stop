region          = ""
function_name   = "start-stop"
lambda_runtime  = "python3.12"
lambda_timeout  = 60
env_key         = "Schedule"
env_value       = "True"
event_rule_name = "ec2_stop_start"
event_rule_des1 = "Trigger Lambda to start EC2 instances"
event_rule_des2 = "Trigger Lambda to stop EC2 instances"
start_rule_name = "start-ec2"
stop_rule_name  = "stop-ec2"
start_cron      = "cron(0 8 * * ? *)"
stop_cron       = "cron(0 17 * * ? *)"
