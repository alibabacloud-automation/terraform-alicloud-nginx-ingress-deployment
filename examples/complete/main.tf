# Data source to query RAM roles
data "alicloud_ram_roles" "roles" {
  policy_type = "Custom"
  name_regex  = "^Aliyun.*Role$"
}

# Configure the Alicloud Provider
provider "alicloud" {
  region = var.region
}

# Call the nginx-ingress module
module "nginx_ingress" {
  source = "../../"

  existing_ram_roles = [for role in data.alicloud_ram_roles.roles.roles : role.name]

  vpc_config = {
    cidr_block = var.vpc_cidr_block
    vpc_name   = var.vpc_name
  }

  vswitch_config = {
    cidr_block   = var.vswitch_cidr_block
    vswitch_name = var.vswitch_name
    zone_id      = var.vswitch_zone_id
  }

  cluster_config = {
    name                         = var.cluster_name
    cluster_spec                 = var.cluster_spec
    service_cidr                 = var.service_cidr
    new_nat_gateway              = var.new_nat_gateway
    slb_internet_enabled         = var.slb_internet_enabled
    is_enterprise_security_group = var.is_enterprise_security_group
  }

  cluster_addons = var.cluster_addons

  node_pool_config = {
    node_pool_name       = var.node_pool_name
    instance_types       = var.node_pool_instance_types
    system_disk_category = var.system_disk_category
    system_disk_size     = var.system_disk_size
    desired_size         = var.desired_size
    runtime_name         = var.runtime_name
    runtime_version      = var.runtime_version
  }
}