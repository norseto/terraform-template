#--------------------------------------------------------------
# Nodule Variables
#--------------------------------------------------------------
variable "backend_lock" {
  type        = string
  description = "(Required) Lock table name for state."
}

variable "backend_bucket" {
  type        = string
  description = "(Required) S3 bucket name for state."
}
