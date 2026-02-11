variable "region" {
  type        = string
  description = "The Alicloud region to deploy resources"
  default     = "cn-hangzhou"
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "192.168.0.0/16"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
  default     = "nginx-ingress-example-vpc"
}

variable "vswitch_cidr_block" {
  type        = string
  description = "CIDR block for the VSwitch"
  default     = "192.168.0.0/24"
}

variable "vswitch_name" {
  type        = string
  description = "Name of the VSwitch"
  default     = "nginx-ingress-example-vswitch"
}

variable "vswitch_zone_id" {
  type        = string
  description = "Zone ID for the VSwitch"
  default     = "cn-hangzhou-i"
}

variable "cluster_name" {
  type        = string
  description = "Name of the ACK cluster"
  default     = "nginx-ingress-example-cluster"
}

variable "cluster_spec" {
  type        = string
  description = "Specification of the ACK cluster"
  default     = "ack.pro.small"
}

variable "service_cidr" {
  type        = string
  description = "Service CIDR for the ACK cluster"
  default     = "172.16.0.0/16"
}

variable "new_nat_gateway" {
  type        = bool
  description = "Whether to create a new NAT gateway"
  default     = true
}

variable "slb_internet_enabled" {
  type        = bool
  description = "Whether to enable internet SLB"
  default     = false
}

variable "is_enterprise_security_group" {
  type        = bool
  description = "Whether to use enterprise security group"
  default     = false
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

variable "node_pool_name" {
  type        = string
  description = "Name of the node pool"
  default     = "nginx-ingress-example-nodepool"
}

variable "node_pool_instance_types" {
  type        = list(string)
  description = "Instance types for the node pool"
  default     = ["ecs.c7.2xlarge"]
}

variable "system_disk_category" {
  type        = string
  description = "System disk category for node pool"
  default     = "cloud_essd"
}

variable "system_disk_size" {
  type        = number
  description = "System disk size for node pool"
  default     = 40
}

variable "desired_size" {
  type        = number
  description = "Desired size of the node pool"
  default     = 3
}

variable "runtime_name" {
  type        = string
  description = "Runtime name for the node pool"
  default     = "containerd"
}

variable "runtime_version" {
  type        = string
  description = "Runtime version for the node pool"
  default     = "1.6.20"
}