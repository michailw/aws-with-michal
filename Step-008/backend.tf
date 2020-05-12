terraform {
  backend "s3" {
    bucket = "state-management-indacloud"
    key    = "terraform/indacloud-test/state.tfstate"
    region = "eu-central-1"
    profile = "indacloud"
    dynamodb_table = "indacloud_lock_table"
  }
}

data "terraform_remote_state" "my_stack" {
  backend = "s3"
  config = {
    profile = "indacloud"
    bucket = "state-management-indacloud"
    key    = "terraform/indacloud-test/state.tfstate"
    region = "eu-central-1"
  }
}
