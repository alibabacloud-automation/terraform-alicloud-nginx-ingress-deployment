Terraform Module for Deploying Nginx with Ingress on Alibaba Cloud

# terraform-alicloud-nginx-ingress-deployment

English | [简体中文](https://github.com/alibabacloud-automation/terraform-alicloud-nginx-ingress-deployment/blob/main/README-CN.md)

This Terraform module deploys Nginx and exposes the service through Ingress on Alibaba Cloud. It creates a complete infrastructure including VPC, VSwitch, ACK (Alibaba Cloud Container Service for Kubernetes) cluster with Nginx Ingress Controller addon. This module is designed to implement the solution [Deploy Nginx and expose the service through Ingress](https://www.aliyun.com/solution/tech-solution/nginx-ingress), which involves Virtual Private Cloud (VPC), VSwitch, Elastic Compute Service (ECS), Container Service for Kubernetes (ACK), and Simple Log Service (SLS).

## Usage

Basic usage of this module is as follows:

```terraform
module "nginx_ingress" {
  source = "alibabacloud-automation/nginx-ingress-deployment/alicloud"

  vpc_config = {
    cidr_block = "192.168.0.0/16"
    vpc_name   = "nginx-ingress-vpc"
  }

  vswitch_config = {
    cidr_block   = "192.168.0.0/24"
    vswitch_name = "nginx-ingress-vswitch"
    zone_id      = "cn-hangzhou-h"
  }

  cluster_config = {
    name = "nginx-ingress-cluster"
  }

  node_pool_config = {
    node_pool_name = "nginx-ingress-nodepool"
    instance_types = ["ecs.g6.large"]
  }
}
```

## Examples

* [Complete Example](https://github.com/alibabacloud-automation/terraform-alicloud-nginx-ingress-deployment/tree/main/examples/complete)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_cs_kubernetes_node_pool.node_pool](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cs_kubernetes_node_pool) | resource |
| [alicloud_cs_managed_kubernetes.ack](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cs_managed_kubernetes) | resource |
| [alicloud_ram_role.role](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ram_role) | resource |
| [alicloud_ram_role_policy_attachment.attach](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ram_role_policy_attachment) | resource |
| [alicloud_vpc.vpc](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.vswitch](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vswitch) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_addons"></a> [cluster\_addons](#input\_cluster\_addons) | List of cluster addons to install | <pre>list(object({<br/>    name   = string<br/>    config = optional(string, "")<br/>  }))</pre> | <pre>[<br/>  {<br/>    "name": "security-inspector"<br/>  },<br/>  {<br/>    "config": "{\"IPVlan\":\"false\",\"NetworkPolicy\":\"false\",\"ENITrunking\":\"false\"}",<br/>    "name": "terway-eniip"<br/>  },<br/>  {<br/>    "name": "csi-plugin"<br/>  },<br/>  {<br/>    "name": "csi-provisioner"<br/>  },<br/>  {<br/>    "config": "{\"CnfsOssEnable\":\"false\",\"CnfsNasEnable\":\"false\"}",<br/>    "name": "storage-operator"<br/>  },<br/>  {<br/>    "config": "{\"IngressDashboardEnabled\":\"true\"}",<br/>    "name": "logtail-ds"<br/>  },<br/>  {<br/>    "config": "{\"IngressSlbNetworkType\":\"internet\",\"IngressSlbSpec\":\"slb.s2.small\"}",<br/>    "name": "nginx-ingress-controller"<br/>  },<br/>  {<br/>    "name": "ack-node-local-dns"<br/>  },<br/>  {<br/>    "name": "arms-prometheus"<br/>  },<br/>  {<br/>    "config": "{\"sls_project_name\":\"\"}",<br/>    "name": "ack-node-problem-detector"<br/>  }<br/>]</pre> | no |
| <a name="input_cluster_config"></a> [cluster\_config](#input\_cluster\_config) | ACK cluster configuration parameters. The attribute 'name' is required. | <pre>object({<br/>    name                         = string<br/>    cluster_spec                 = optional(string, "ack.pro.small")<br/>    service_cidr                 = optional(string, "172.16.0.0/16")<br/>    new_nat_gateway              = optional(bool, true)<br/>    slb_internet_enabled         = optional(bool, false)<br/>    is_enterprise_security_group = optional(bool, false)<br/>  })</pre> | n/a | yes |
| <a name="input_existing_ram_roles"></a> [existing\_ram\_roles](#input\_existing\_ram\_roles) | List of existing RAM role names to avoid recreating them | `list(string)` | `[]` | no |
| <a name="input_node_pool_config"></a> [node\_pool\_config](#input\_node\_pool\_config) | Node pool configuration parameters. The attributes 'node\_pool\_name' and 'instance\_types' are required. | <pre>object({<br/>    node_pool_name       = string<br/>    instance_types       = list(string)<br/>    system_disk_category = optional(string, "cloud_essd")<br/>    system_disk_size     = optional(number, 40)<br/>    desired_size         = optional(number, 3)<br/>    runtime_name         = optional(string, "containerd")<br/>    runtime_version      = optional(string, "1.6.20")<br/>  })</pre> | n/a | yes |
| <a name="input_vpc_config"></a> [vpc\_config](#input\_vpc\_config) | VPC configuration parameters. The attribute 'cidr\_block' is required. | <pre>object({<br/>    cidr_block = string<br/>    vpc_name   = optional(string, "nginx-ingress-vpc")<br/>  })</pre> | n/a | yes |
| <a name="input_vswitch_config"></a> [vswitch\_config](#input\_vswitch\_config) | VSwitch configuration parameters. The attributes 'cidr\_block' and 'zone\_id' are required. | <pre>object({<br/>    cidr_block   = string<br/>    vswitch_name = optional(string, "nginx-ingress-vswitch")<br/>    zone_id      = string<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_connections"></a> [cluster\_connections](#output\_cluster\_connections) | The connection information of the ACK cluster |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The ID of the ACK cluster |
| <a name="output_cluster_nat_gateway_id"></a> [cluster\_nat\_gateway\_id](#output\_cluster\_nat\_gateway\_id) | The NAT gateway ID of the ACK cluster |
| <a name="output_cluster_slb_internet"></a> [cluster\_slb\_internet](#output\_cluster\_slb\_internet) | The public load balancer IP of the ACK cluster |
| <a name="output_cluster_slb_intranet"></a> [cluster\_slb\_intranet](#output\_cluster\_slb\_intranet) | The private load balancer ID of the ACK cluster |
| <a name="output_cluster_vpc_id"></a> [cluster\_vpc\_id](#output\_cluster\_vpc\_id) | The VPC ID of the ACK cluster |
| <a name="output_created_ram_roles"></a> [created\_ram\_roles](#output\_created\_ram\_roles) | The list of created RAM roles |
| <a name="output_node_pool_id"></a> [node\_pool\_id](#output\_node\_pool\_id) | The ID of the node pool |
| <a name="output_node_pool_scaling_group_id"></a> [node\_pool\_scaling\_group\_id](#output\_node\_pool\_scaling\_group\_id) | The scaling group ID of the node pool |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | The CIDR block of the VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
| <a name="output_vswitch_cidr_block"></a> [vswitch\_cidr\_block](#output\_vswitch\_cidr\_block) | The CIDR block of the VSwitch |
| <a name="output_vswitch_id"></a> [vswitch\_id](#output\_vswitch\_id) | The ID of the VSwitch |
<!-- END_TF_DOCS -->

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)