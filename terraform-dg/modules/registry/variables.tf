variable "name" { type = string }
variable "subscription_tier_slug" {
  description = "starter | basic | professional"
  type        = string
  default     = "starter"
}
variable "tags" {
  type        = list(string)
  default     = []
}
