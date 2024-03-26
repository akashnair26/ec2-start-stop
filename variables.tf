variable "region" {
  type = string
  default = "ap-south-1"
}

variable "function_name" {
  type = string
#   default = "start"
}

variable "lambda_timeout" {
  type = number
  default = 3
}

variable "lambda_runtime" {
  type = string
  default = "python3.12"
}

variable "env_key" {
  type = string
  # default = "Schedule"
}

variable "env_value" {
  type = string
  # default = "True"
}
variable "event_rule_name" {
  type = string
#   default = "start-stop"
}

variable "event_rule_des1" {
  type = string
#   default = "This is a random text"
}

variable "event_rule_des2" {
  type = string
#   default = "This is a random text"
}

variable "start_rule_name" {
  type = string
}

variable "stop_rule_name" {
  type = string
}

variable "start_cron" {
  type = string
  default = "cron(*/5 * * * ? *)"
}

variable "stop_cron" {
  type = string
  default = "cron(*/10 * * * ? *)"
}