terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-test-sagar"  
    key            = "terraform/state"              
    region         = "ca-central-1"                    
    dynamodb_table = "terraform-locks"             
    encrypt        = true                            
  }
}