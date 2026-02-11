output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.nginx_ingress.vpc_id
}

output "vswitch_id" {
  description = "The ID of the VSwitch"
  value       = module.nginx_ingress.vswitch_id
}

output "cluster_id" {
  description = "The ID of the ACK cluster"
  value       = module.nginx_ingress.cluster_id
}

output "cluster_connections" {
  description = "The connection information of the ACK cluster"
  value       = module.nginx_ingress.cluster_connections
}

output "node_pool_id" {
  description = "The ID of the node pool"
  value       = module.nginx_ingress.node_pool_id
}
