variable "rds_master_user" {
  type = string
  default = "admin"
}

variable "rds_master_password" {
  type = string
}

variable "rds_delete_protection" {
  type = bool
  default = true
}

variable "rds_skip_final_snapshot" {
  type = bool
  default = false
}
