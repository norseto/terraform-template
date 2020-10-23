#--------------------------------------------------------------
# Nodule Variables
#--------------------------------------------------------------
variable "region" {
  type        = string
  description = "(Required) The Location of backend bucket."
}

variable "backend_rgname" {
  type        = string
  description = "(Required) Storage resource group name for state."
}

variable "backend_acctname" {
  type        = string
  description = "(Required) Storage account name for state."
}

variable "backend_containername" {
  type        = string
  description = "(Required) Storage container name for state."
}
