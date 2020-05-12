resource "aws_dynamodb_table" "dynamodb_terraform_lock" {
   name = "indacloud_lock_table"
   hash_key = "LockID"
   read_capacity = 5
   write_capacity = 5

   attribute {
      name = "LockID"
      type = "S"
   }
}
