# Step 003

### Purpose

1. Set up VPC
2. Set up Subnet
3. Set up security group

### Final solution in Terraform
Please checkout branch `solution/step-003`

In directory `terraform-exercise-standard` you will find set of standard Terraform directives.

Directory `terraform-exercise-vpc-module` shows a usage of `terraform-aws-modules/vpc/aws` module,
which simplifies VPC management.
Note: this module brings to your infrastructure much more than we cover in this subject, like EIP or routing tables.