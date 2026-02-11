# Complete Example

This example demonstrates how to deploy Nginx and expose the service through Ingress using the nginx-ingress module.

## Usage

To run this example, you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| alicloud | >= 1.0 |

## Providers

| Name | Version |
|------|---------|
| alicloud | >= 1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| nginx_ingress | ../../ | n/a |

## Resources

No resources created directly in this example.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| region | The Alicloud region to deploy resources | `string` | `"cn-hangzhou"` | no |
| cluster_name | Name of the ACK cluster | `string` | `"nginx-ingress-example-cluster"` | no |
| vpc_cidr_block | CIDR block for the VPC | `string` | `"192.168.0.0/16"` | no |
| vswitch_cidr_block | CIDR block for the VSwitch | `string` | `"192.168.0.0/24"` | no |

## Outputs

| Name | Description |
|------|-------------|
| vpc_id | The ID of the VPC |
| cluster_id | The ID of the ACK cluster |
| cluster_connections | The connection information of the ACK cluster |
| node_pool_id | The ID of the node pool |

## Features

This example creates:

- A VPC with the specified CIDR block
- A VSwitch in an automatically selected availability zone
- An ACK (Alibaba Cloud Container Service for Kubernetes) Pro cluster
- A node pool with 3 nodes using containerd runtime
- Required RAM roles for cluster operations
- Nginx Ingress Controller addon for exposing services

## Notes

- The cluster is configured with Terway CNI for networking
- Internet SLB is disabled by default for security
- The example uses enterprise security groups for enhanced security
- All required ACK service roles are created automatically