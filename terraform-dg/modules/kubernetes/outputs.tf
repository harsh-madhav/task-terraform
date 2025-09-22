output "cluster_id"   { value = digitalocean_kubernetes_cluster.foo.id }
output "cluster_urn"  { value = digitalocean_kubernetes_cluster.foo.urn }
output "kubeconfig"   {
  value     = local.kubeconfig
  sensitive = true
}
