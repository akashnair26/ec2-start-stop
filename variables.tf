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