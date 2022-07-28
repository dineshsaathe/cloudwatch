variable "dashboard-name" {
  default = "cw-dashboard-default-NONAME"
  description = "user defined dashboard name"
}
variable "aws-region" {
  default = "eu-west-1"
  description = "aws region used"
}
variable "targets" {
  type = list(string)  
  description = "AWS service targets for monitoring"
}
variable "metrics" {
  type = list(string)
  default = ["NetworkIn", "NetworkOut", "CPUUtilization", "CheckFailed"]
  description = "graph metrics used for dashboard - required"
}
variable "aws-namespace" {
 
}
variable "service_name" {
  type = list(string)
}

variable "dim" {
  description = "aws-namespace dimention - required"
}
variable "stat" {
  default = "Average"
  description = "graph stat used for dashboard - default: Average"
}
variable "period" {
  type = number
  default = 300
  description = "graph stat used for dashboard - default: Average"
}
