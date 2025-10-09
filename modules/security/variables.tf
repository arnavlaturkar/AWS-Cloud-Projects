variable "sg_name" {
  description = "Security Group name"
  type        = string
  default     = "terraform_allow_ssh"
}

variable "sg_description" {
  description = "Security Group description"
  type        = string
  default     = "Allow SSH inbound traffic"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
  # No default, must be passed if variable used in future
}

variable "ingress_cidr_blocks" {
  description = "CIDR blocks allowed inbound"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_cidr_blocks" {
  description = "CIDR blocks allowed outbound"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "tags" {
  description = "Tags for Security Group"
  type        = map(string)
  default     = {
    Name = "terraform_allow_ssh"
  }
}
