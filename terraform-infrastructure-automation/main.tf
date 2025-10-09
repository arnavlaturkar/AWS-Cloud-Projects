provider "aws" {
  region = "us-east-1"
}

# Call network module for VPC, subnet, IGW, routing
module "network" {
  source             = "./modules/network"
  vpc_cidr           = "10.0.0.0/16"
  vpc_name           = "terraform-main-vpc"
  public_subnet_cidr = "10.0.1.0/24"
  availability_zone  = "us-east-1a"
  public_subnet_name = "terraform-public-subnet"
}

# Call security module for Security Group
module "security" {
  source              = "./modules/security"
  sg_name             = "terraform_allow_ssh"
  sg_description      = "Allow SSH inbound traffic"
  vpc_id              = module.network.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_cidr_blocks  = ["0.0.0.0/0"]
  tags = {
    Name = "terraform_allow_ssh"
  }
}

# Call S3 module for bucket creation
module "s3" {
  source      = "./modules/s3"
  bucket_name = "terraform-bucket-2025-arnav"
  tags = {
    Name = "terraform-bucket-2025-arnav"
  }
}

# EC2 Instance defined inline as before
resource "aws_instance" "example" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t3.micro"

  metadata_options {
    http_tokens = "required"
  }

  root_block_device {
    encrypted = true
  }

  tags = {
    Name = "IAC_instance"
  }
}

