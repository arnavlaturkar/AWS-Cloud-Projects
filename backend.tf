# Configuring backend resource to use Remote State with Terraform

terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-arnav-2025"    
    key            = "state/terraform.tfstate"             
    region         = "us-east-1"                            
    dynamodb_table = "terraform-lock-table-arnav"          
    encrypt        = true                                   
  }
}