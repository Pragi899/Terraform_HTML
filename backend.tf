terraform {
  backend "s3" {
    bucket  = "terraform-module-statefile"
    key     = "terraform_html/dev/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}