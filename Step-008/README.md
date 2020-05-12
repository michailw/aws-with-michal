# Step 008 - Manage Terraform state

### Purpose

1. Create dummy stack with one EC2 iinstance
2. Set up remote Terraform state with S3 bucket
3. Set up Terraform pipeline in Gitlab
4. Set up Terraform pipeline in CircleCI

### Final solution in Terraform
Please checkout branch `solution/step-008`

### References
- Terraform remote state documentation - https://www.terraform.io/docs/providers/terraform/d/remote_state.html
- Terraform S3 backend documentation - https://www.terraform.io/docs/backends/types/s3.html
- AWS CLI environment variables - https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html
- Running Terraform in automation - https://learn.hashicorp.com/terraform/development/running-terraform-in-automation
- Gitlab.com - https://gitlab.com/
- Gitlab pipeline configuration reference - https://docs.gitlab.com/ee/ci/yaml/
- CircleCI - https://circleci.com/
- CircleCI documentation - https://circleci.com/docs/
