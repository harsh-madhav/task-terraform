variable "name" { type = string }
variable "region" { type = string }
variable "node_pool_size" { type = string }
variable "node_pool_count" { type = number }
variable "tags" {
  type    = list(string)
  default = []
}
