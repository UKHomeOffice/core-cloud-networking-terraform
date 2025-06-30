variable "prod_account_id" {
  type = string
}

variable "prod_hub_tgw_id" {
  type = string
}

variable "notprod_account_id" {
  type = string
}

variable "notprod_hub_tgw_id" {
  type = string
}

variable "central_tgw_id" {
  type = string
}

variable "central_hub_tgw_id" {
  type = string
}

variable "region" {
  type = string
  default= "eu-west-2"
}