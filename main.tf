

locals {
  # Define all required CS roles and their policies
  cs_roles = [
    {
      name            = "AliyunCSManagedLogRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "The log component of the cluster uses this role to access your resources in other cloud products."
      policy_name     = "AliyunCSManagedLogRolePolicy"
    },
    {
      name            = "AliyunCSManagedCmsRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "The CMS component of the cluster uses this role to access your resources in other cloud products."
      policy_name     = "AliyunCSManagedCmsRolePolicy"
    },
    {
      name            = "AliyunCSManagedCsiRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "The storage component of the cluster uses this role to access your resources in other cloud products."
      policy_name     = "AliyunCSManagedCsiRolePolicy"
    },
    {
      name            = "AliyunCSManagedCsiPluginRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "The storage component of the cluster uses this role to access your resources in other cloud products."
      policy_name     = "AliyunCSManagedCsiPluginRolePolicy"
    },
    {
      name            = "AliyunCSManagedCsiProvisionerRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "The storage component of the cluster uses this role to access your resources in other cloud products."
      policy_name     = "AliyunCSManagedCsiProvisionerRolePolicy"
    },
    {
      name            = "AliyunCSManagedVKRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "The VK component of ACK Serverless cluster uses this role to access your resources in other cloud products."
      policy_name     = "AliyunCSManagedVKRolePolicy"
    },
    {
      name            = "AliyunCSServerlessKubernetesRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "The cluster uses this role by default to access your resources in other cloud products."
      policy_name     = "AliyunCSServerlessKubernetesRolePolicy"
    },
    {
      name            = "AliyunCSKubernetesAuditRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "The cluster audit feature uses this role to access your resources in other cloud products."
      policy_name     = "AliyunCSKubernetesAuditRolePolicy"
    },
    {
      name            = "AliyunCSManagedNetworkRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "The cluster network component uses this role to access your resources in other cloud products."
      policy_name     = "AliyunCSManagedNetworkRolePolicy"
    },
    {
      name            = "AliyunCSDefaultRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "The cluster uses this role by default when operating to access your resources in other cloud products."
      policy_name     = "AliyunCSDefaultRolePolicy"
    },
    {
      name            = "AliyunCSManagedKubernetesRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "The cluster uses this role by default to access your resources in other cloud products."
      policy_name     = "AliyunCSManagedKubernetesRolePolicy"
    },
    {
      name            = "AliyunCSManagedArmsRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "The cluster Arms plugin uses this role to access your resources in other cloud products."
      policy_name     = "AliyunCSManagedArmsRolePolicy"
    },
    {
      name            = "AliyunCISDefaultRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "Container Service (CS) intelligent operation and maintenance uses this role to access your resources in other cloud products."
      policy_name     = "AliyunCISDefaultRolePolicy"
    },
    {
      name            = "AliyunOOSLifecycleHook4CSRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"oos.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "The cluster scaling node pool depends on the OOS service, and OOS uses this role to access your resources in other cloud products."
      policy_name     = "AliyunOOSLifecycleHook4CSRolePolicy"
    },
    {
      name            = "AliyunCSManagedAutoScalerRole"
      policy_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description     = "The cluster's elastic scaling component uses this role to access your resources in other cloud products."
      policy_name     = "AliyunCSManagedAutoScalerRolePolicy"
    }
  ]

  # Extract all required RAM role names
  all_role_names = [for role in local.cs_roles : role.name]

  # Extract existing RAM role names
  created_role_names = [for role in var.existing_ram_roles : role]

  # Calculate complement: find roles that need to be created
  complement_names = setsubtract(local.all_role_names, local.created_role_names)

  # Roles to be created
  complement_roles = [for role in local.cs_roles : role if contains(local.complement_names, role.name)]
}

resource "alicloud_vpc" "vpc" {
  cidr_block = var.vpc_config.cidr_block
  vpc_name   = var.vpc_config.vpc_name
}

resource "alicloud_vswitch" "vswitch" {
  vpc_id       = alicloud_vpc.vpc.id
  cidr_block   = var.vswitch_config.cidr_block
  zone_id      = var.vswitch_config.zone_id
  vswitch_name = var.vswitch_config.vswitch_name
}

resource "alicloud_cs_managed_kubernetes" "ack" {
  name                         = var.cluster_config.name
  cluster_spec                 = var.cluster_config.cluster_spec
  vswitch_ids                  = [alicloud_vswitch.vswitch.id]
  pod_vswitch_ids              = [alicloud_vswitch.vswitch.id]
  service_cidr                 = var.cluster_config.service_cidr
  new_nat_gateway              = var.cluster_config.new_nat_gateway
  slb_internet_enabled         = var.cluster_config.slb_internet_enabled
  is_enterprise_security_group = var.cluster_config.is_enterprise_security_group

  dynamic "addons" {
    for_each = var.cluster_addons
    content {
      name   = addons.value.name
      config = addons.value.config
    }
  }
}

resource "alicloud_cs_kubernetes_node_pool" "node_pool" {
  node_pool_name       = var.node_pool_config.node_pool_name
  cluster_id           = alicloud_cs_managed_kubernetes.ack.id
  vswitch_ids          = [alicloud_vswitch.vswitch.id]
  instance_types       = var.node_pool_config.instance_types
  system_disk_category = var.node_pool_config.system_disk_category
  system_disk_size     = var.node_pool_config.system_disk_size
  desired_size         = var.node_pool_config.desired_size
  runtime_name         = var.node_pool_config.runtime_name
  runtime_version      = var.node_pool_config.runtime_version
}

# Create roles
resource "alicloud_ram_role" "role" {
  for_each                    = { for r in local.complement_roles : r.name => r }
  role_name                   = each.value.name
  assume_role_policy_document = each.value.policy_document
  description                 = each.value.description
}

# Attach system policies to roles
resource "alicloud_ram_role_policy_attachment" "attach" {
  for_each    = { for r in local.complement_roles : r.name => r }
  policy_name = each.value.policy_name
  policy_type = "System"
  role_name   = each.value.name
  depends_on  = [alicloud_ram_role.role]
}