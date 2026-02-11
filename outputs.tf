output "vpc_id" {
  description = "The ID of the VPC"
  value       = alicloud_vpc.vpc.id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = alicloud_vpc.vpc.cidr_block
}

output "vswitch_id" {
  description = "The ID of the VSwitch"
  value       = alicloud_vswitch.vswitch.id
}

output "vswitch_cidr_block" {
  description = "The CIDR block of the VSwitch"
  value       = alicloud_vswitch.vswitch.cidr_block
}

output "cluster_id" {
  description = "The ID of the ACK cluster"
  value       = alicloud_cs_managed_kubernetes.ack.id
}

output "cluster_vpc_id" {
  description = "The VPC ID of the ACK cluster"
  value       = alicloud_cs_managed_kubernetes.ack.vpc_id
}

output "cluster_nat_gateway_id" {
  description = "The NAT gateway ID of the ACK cluster"
  value       = alicloud_cs_managed_kubernetes.ack.nat_gateway_id
}

output "cluster_slb_intranet" {
  description = "The private load balancer ID of the ACK cluster"
  value       = alicloud_cs_managed_kubernetes.ack.slb_intranet
}

output "cluster_slb_internet" {
  description = "The public load balancer IP of the ACK cluster"
  value       = alicloud_cs_managed_kubernetes.ack.slb_internet
}

output "cluster_connections" {
  description = "The connection information of the ACK cluster"
  value       = alicloud_cs_managed_kubernetes.ack.connections
}

output "node_pool_id" {
  description = "The ID of the node pool"
  value       = alicloud_cs_kubernetes_node_pool.node_pool.id
}

output "node_pool_scaling_group_id" {
  description = "The scaling group ID of the node pool"
  value       = alicloud_cs_kubernetes_node_pool.node_pool.scaling_group_id
}

output "created_ram_roles" {
  description = "The list of created RAM roles"
  value       = [for role in alicloud_ram_role.role : role.role_name]
}