阿里云上部署 Nginx 并通过 Ingress 暴露服务的 Terraform 模块

================================================ 

# terraform-alicloud-nginx-ingress-deployment

[English](https://github.com/alibabacloud-automation/terraform-alicloud-nginx-ingress-deployment/blob/main/README.md) | 简体中文

此 Terraform 模块在阿里云上部署 Nginx 并通过 Ingress 暴露服务。它创建完整的基础设施，包括 VPC、交换机、ACK（阿里云容器服务 Kubernetes 版）集群和 Nginx Ingress Controller 插件。此模块旨在实现解决方案[部署 Nginx 并通过 Ingress 暴露服务](https://www.aliyun.com/solution/tech-solution/nginx-ingress)，涉及专有网络（VPC）、交换机（VSwitch）、云服务器（ECS）、容器服务 Kubernetes（ACK）和日志服务（SLS）。

## 使用方法

此模块的基本用法如下：

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

## 示例

* [完整示例](https://github.com/alibabacloud-automation/terraform-alicloud-nginx-ingress-deployment/tree/main/examples/complete)

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->

## 提交问题

如果您在使用此模块时遇到任何问题，请提交一个 [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) 并告知我们。

**注意：** 不建议在此仓库中提交问题。

## 作者

由阿里云 Terraform 团队创建和维护(terraform@alibabacloud.com)。

## 许可证

MIT 许可。有关完整详细信息，请参阅 LICENSE。

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)