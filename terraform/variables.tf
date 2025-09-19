variable "env_name" {
  type = string
}

variable "aws_region" {
  type = string
  default = "us-west-1"
}

variable "tf_state_bucket" {
  type = string
}

variable "tf_lock_table" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "replication" {
  type = bool
  default = false
}



