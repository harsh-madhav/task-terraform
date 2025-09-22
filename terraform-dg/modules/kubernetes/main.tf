resource "digitalocean_kubernetes_cluster" "foo" {
  name   = var.name
  region = var.region
  version = "latest"

  tags     = var.tags
  node_pool {
    name       = "default-pool"
    size       = var.node_pool_size
    node_count = var.node_pool_count
    tags       = var.tags
  }
}

# Expose kubeconfig
locals {
  kubeconfig = digitalocean_kubernetes_cluster.foo.kube_config[0].raw_config
}
