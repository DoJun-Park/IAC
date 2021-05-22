terraform {
 backend "s3" {
  bucket = "202105-apnorthease2-tfstate"
  key = "terraform/IAM/terraform.tfstate"
  region = "ap-northeast-2"
  encrypt = true
  dynamodb_table = "TerraformStateLock"
  }
}
~  
