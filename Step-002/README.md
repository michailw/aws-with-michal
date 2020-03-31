# Step 002

### Purpose

1. Set up local AWS CLI profile
2. Create a simple Terraform template with S3 bucket + CloudFront distribution

### Commands used in this subject
(google for detailed help of each instruction)

- `aws configure`
- `terraform init`
- `terraform plan`
- `terraform apply`
- `terraform output`

### Solution tips

1. Change your profile in `provider.tf` file
2. Personalize your experience with local variables on the top of `main.tf` file
3. S3 bucket policy is the key to explicit access for CLoud Front to S3 bucket files
