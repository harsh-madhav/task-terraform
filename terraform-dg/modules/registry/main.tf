resource "digitalocean_container_registry" "task_registry" {
  name                   = var.name
  subscription_tier_slug = var.subscription_tier_slug
}
