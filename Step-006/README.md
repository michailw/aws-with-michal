# Step 006 - Set up RDS cluster

### Purpose

1. Set up VPC with two public and two private subnets
2. Set up bastion host in a public VPC
3. Set up RDS cluster

### Final solution in Terraform
Please checkout branch `solution/step-006`

### References
- DB instance types - https://aws.amazon.com/rds/instance-types/
- Read replicas - https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReadRepl.html
- PostgreSQL replication - https://www.postgresql.org/docs/10/different-replication-solutions.html

```bash
aws rds describe-db-engine-versions --engine aurora-postgresql --query "DBEngineVersions[].EngineVersion" 
```
