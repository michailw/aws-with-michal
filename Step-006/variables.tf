variable "bastion_host_name" {
  type = string
  default = "Indacloud Bastion Host"
}

variable "bastion_host_public_key" {
  type = string
}

variable "rds_master_user" {
  type = string
  default = "admin"
}

variable "rds_master_password" {
  type = string
  default = "admin1"
}

variable "rds_delete_protection" {
  type = bool
  default = true
}

variable "rds_skip_final_snapshot" {
  type = bool
  default = false
}
