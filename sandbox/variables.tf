variable "region" {
  description = "AWS region in which the project needs to be setup (us-east-1, ca-west-1, eu-west-3, etc)"
}

variable "tags" {
  default = {
    Name   = "vpc-id-001"
    vpc-id = "vpc-001234"
  }
  description = "The tags to apply to the VPC"
  type        = map(string)
  nullable    = true
  sensitive   = false
}

