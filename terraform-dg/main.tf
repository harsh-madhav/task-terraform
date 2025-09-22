module "kubernetes" {
  source          = "./modules/kubernetes"
  name            = var.cluster_name
  region          = var.region
  node_pool_size  = var.node_pool_size
  node_pool_count = var.node_pool_count
}

module "registry" {
  source                 = "./modules/registry"
  name                   = var.registry_name
  subscription_tier_slug = var.registry_tier
}
