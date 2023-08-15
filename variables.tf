variable "access_key" {
     description = "Access key to AWS console"
}
variable "secret_key" {
     description = "Secret key to AWS console"
}
variable "region" {
     description = "Region of AWS VPC"
}

variable "token" {
     description = "Secret key to AWS console"
}
variable "name" {
  type        = string
  description = "The name of the role. "
}


variable "account_id" {

  type        = string
  description = "The name of the role. "
}


variable "my_account_id" {

  type        = string
  description = "The name of the role. "
}
variable "external_id" {

  type        = string
  description = "The name of the role. "
}

variable "monitoring_policy_name" {
  type        = string
  description = "The name of the policy. "
}

variable "private-1" {
  default = "subnet-XXX"
  type        = string
  description = "The name of the my aws. "
}


variable "awsprops" {
    type = map
    /* default = {
    region = "us-east-1"
    vpc = "vpc-XXXX"
    ami = "ami-XXXX"
    itype = "t2.medium"
    subnet = "subnet-XXXXX"
    publicip = true
    keyname = "tf-test"

  } */
}

variable "dynatrace_activeGate_role" {

  type        = string
  description = "The name of the role. "
}


variable "user_tenant_id" {

  #type        = string
  description = "The name of the role. "
}


variable "user_pass_token" {

  #type        = string
  description = "The name of the role. "
}

variable "user_api_token" {
  #type        = string
  description = "The name of the role. "
}

variable "tags" {
    type = map

}

variable "connection_name" {
  type        = string
  description = "AWS account name"
}


variable "dt_installer" {
  type        = string
  description = "Dynatarce ActiveGate installer name"
  }
