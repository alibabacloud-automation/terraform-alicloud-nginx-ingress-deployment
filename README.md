Terraform Module for Deploying Nginx with Ingress on Alibaba Cloud

================================================ 

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
  }

  cluster_config = {
    name = "nginx-ingress-cluster"
  }

  node_pool_config = {
    node_pool_name = "nginx-ingress-nodepool"
  }
}
```

## Examples

* [Complete Example](https://github.com/alibabacloud-automation/terraform-alicloud-nginx-ingress-deployment/tree/main/examples/complete)

<!-- BEGIN_TF_DOCS -->
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