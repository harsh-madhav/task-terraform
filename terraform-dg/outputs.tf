output "cluster_id" { value = module.kubernetes.cluster_id }
output "cluster_urn" { value = module.kubernetes.cluster_urn }
output "kubeconfig" {
  description = "Raw kubeconfig for the created cluster"
  value       = module.kubernetes.kubeconfig
  sensitive   = true
}

output "registry_endpoint" { value = module.registry.registry_endpoint }
output "registry_name" { value = module.registry.registry_name }
