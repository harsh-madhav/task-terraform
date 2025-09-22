variable "project_name" {
  description = "Name of the DigitalOcean project"
  type        = string
}

variable "region" {
  description = "DigitalOcean region (e.g., nyc1, sfo3, fra1)"
  type        = string
}


variable "tags" {
  description = "Tags applied to all resources"
  type        = list(string)
  default     = []
}

variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
}

variable "node_pool_size" {
  description = "Droplet size for nodes (e.g., s-2vcpu-4gb)"
  type        = string
}

variable "node_pool_count" {
  description = "Number of nodes in default pool"
  type        = number
  default     = 1
}

variable "registry_name" {
  description = "Name of the DO Container Registry"
  type        = string
}

variable "registry_tier" {
  description = "Registry subscription tier (starter, basic, professional)"
  type        = string
  default     = "starter"
}

variable "do_token" {
  description = "DigitalOcean API token"
  type        = string  
}