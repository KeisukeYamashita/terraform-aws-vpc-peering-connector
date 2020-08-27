# AWS VPC Peering Connector module

This module creates an AWS VPC peering connector and route.

## Usage

```hcl
module "vpc_peering" {
  source  = "KeisukeYamashita/terraform-aws-vpc-peering-mongo-atlas"
  version = "~> 1.0"
  
  target_cidr_block = "100.200.100.200/20"
  target_peering_id = "pcx-000111222333444"
  auto_accept       = true
  
  route_table_id = aws_route_table.my_table.id
}
```

## Examples

* [notify-slack-simple](https://github.com/terraform-aws-modules/terraform-aws-notify-slack/tree/master/examples/notify-slack-simple) - Creates SNS topic which sends messages to Slack channel.
* [cloudwatch-alerts-to-slack](https://github.com/terraform-aws-modules/terraform-aws-notify-slack/tree/master/examples/cloudwatch-alerts-to-slack) - End to end example which shows how to send AWS Cloudwatch alerts to Slack channel and use KMS to encrypt webhook URL.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0, < 0.14 |
| aws | >= 3.0, < 4.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| auto_accept       | Accept VPC peering automatically    | `bool`   | `false` | no  |
| route_table_id    | ID of the route table to associate  | `string` | `null`  | yes |
| target_cidr_block | CIDR block of the target VPC        | `string` | `null`  | yes | 
| target_peering_id | ID of the peering target            | `string` | `null`  | yes |

## Author

* [KeisukeYamashita](https://github.com/KeisukeYamashita)

## License

Apache 2.0 Licensed. See LICENSE for full details.
