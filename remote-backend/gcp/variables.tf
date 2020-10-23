#--------------------------------------------------------------
# Nodule Variables
#--------------------------------------------------------------
variable "region" {
  type        = string
  description = "(Required) The Location of backend bucket."
}

variable "backend_bucket" {
  type        = string
  description = "(Required) Storage bucket name for state."
}
