
variable "existing_ram_roles" {
  type        = list(string)
  description = "List of existing RAM role names to avoid recreating them"
  default     = []
}

variable "vpc_config" {
  type = object({
    cidr_block = string
    vpc_name   = optional(string, "nginx-ingress-vpc")
  })
  description = "VPC configuration parameters. The attribute 'cidr_block' is required."
}

variable "vswitch_config" {
  type = object({
    cidr_block   = string
    vswitch_name = optional(string, "nginx-ingress-vswitch")
    zone_id      = string
  })
  description = "VSwitch configuration parameters. The attributes 'cidr_block' and 'zone_id' are required."
}

variable "cluster_config" {
  type = object({
    name                         = string
    cluster_spec                 = optional(string, "ack.pro.small")
    service_cidr                 = optional(string, "172.16.0.0/16")
    new_nat_gateway              = optional(bool, true)
    slb_internet_enabled         = optional(bool, false)
    is_enterprise_security_group = optional(bool, false)
  })
  description = "ACK cluster configuration parameters. The attribute 'name' is required."
}

variable "cluster_addons" {
  type = list(object({
    name   = string
    config = optional(string, "")
  }))
  description = "List of cluster addons to install"
  default = [
    {
      name = "security-inspector"
    },
    {
      name   = "terway-eniip"
      config = "{\"IPVlan\":\"false\",\"NetworkPolicy\":\"false\",\"ENITrunking\":\"false\"}"
    },
    {
      name = "csi-plugin"
    },
    {
      name = "csi-provisioner"
    },
    {
      name   = "storage-operator"
      config = "{\"CnfsOssEnable\":\"false\",\"CnfsNasEnable\":\"false\"}"
    },
    {
      name   = "logtail-ds"
      config = "{\"IngressDashboardEnabled\":\"true\"}"
    },
    {
      name   = "nginx-ingress-controller"
      config = "{\"IngressSlbNetworkType\":\"internet\",\"IngressSlbSpec\":\"slb.s2.small\"}"
    },
    {
      name = "ack-node-local-dns"
    },
    {
      name = "arms-prometheus"
    },
    {
      name   = "ack-node-problem-detector"
      config = "{\"sls_project_name\":\"\"}"
    }
  ]
}

variable "node_pool_config" {
  type = object({
    node_pool_name       = string
    instance_types       = list(string)
    system_disk_category = optional(string, "cloud_essd")
    system_disk_size     = optional(number, 40)
    desired_size         = optional(number, 3)
    runtime_name         = optional(string, "containerd")
    runtime_version      = optional(string, "1.6.20")
  })
  description = "Node pool configuration parameters. The attributes 'node_pool_name' and 'instance_types' are required."
}