terraform {
  backend "s3" {
    bucket = "supermario7736"  
    key    = "EKS/terraform.tfstate"
    region = "ap-south-1"
  }
}
