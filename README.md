# AWS VPC Peering MongoDB Atlas Terraform module

This module creates an SNS topic (or uses an existing one) and an AWS Lambda function that sends notifications to Slack using the [incoming webhooks API](https://api.slack.com/incoming-webhooks).

Start by setting up an [incoming webhook integration](https://my.slack.com/services/new/incoming-webhook/) in your Slack workspace.

Doing serverless with Terraform? Check out [serverless.tf framework](https://serverless.tf), which aims to simplify all operations when working with the serverless in Terraform.

## Usage

```hcl
module "notify_slack" {
  source  = "KeisukeYamashita/terraform-aws-vpc-peering-mongo-atlas"
  version = "~> 1.0"

  sns_topic_name = "slack-topic"

  slack_webhook_url = "https://hooks.slack.com/services/AAA/BBB/CCC"
  slack_channel     = "aws-notification"
  slack_username    = "reporter"
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
| mongo | >= 0.6, < 1.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cloudwatch\_log\_group\_kms\_key\_id | The ARN of the KMS Key to use when encrypting log data for Lambda | `string` | `null` | no |
| cloudwatch\_log\_group\_retention\_in\_days | Specifies the number of days you want to retain log events in log group for Lambda. | `number` | `0` | no |
| cloudwatch\_log\_group\_tags | Additional tags for the Cloudwatch log group | `map(string)` | `{}` | no |
| create | Whether to create all resources | `bool` | `true` | no |
| create\_sns\_topic | Whether to create new SNS topic | `bool` | `true` | no |
| iam\_role\_boundary\_policy\_arn | The ARN of the policy that is used to set the permissions boundary for the role | `string` | `null` | no |
| iam\_role\_name\_prefix | A unique role name beginning with the specified prefix | `string` | `"lambda"` | no |
| iam\_role\_policy\_name\_prefix | A unique policy name beginning with the specified prefix | `string` | `"lambda-policy-"` | no |
| iam\_role\_tags | Additional tags for the IAM role | `map(string)` | `{}` | no |
| kms\_key\_arn | ARN of the KMS key used for decrypting slack webhook url | `string` | `""` | no |
| lambda\_description | The description of the Lambda function | `string` | `null` | no |
| lambda\_function\_name | The name of the Lambda function to create | `string` | `"notify_slack"` | no |
| lambda\_function\_tags | Additional tags for the Lambda function | `map(string)` | `{}` | no |
| log\_events | Boolean flag to enabled/disable logging of incoming events | `bool` | `false` | no |
| reserved\_concurrent\_executions | The amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations | `number` | `-1` | no |
| slack\_channel | The name of the channel in Slack for notifications | `string` | n/a | yes |
| slack\_emoji | A custom emoji that will appear on Slack messages | `string` | `":aws:"` | no |
| slack\_username | The username that will appear on Slack messages | `string` | n/a | yes |
| slack\_webhook\_url | The URL of Slack webhook | `string` | n/a | yes |
| sns\_topic\_kms\_key\_id | ARN of the KMS key used for enabling SSE on the topic | `string` | `""` | no |
| sns\_topic\_name | The name of the SNS topic to create | `string` | n/a | yes |
| sns\_topic\_tags | Additional tags for the SNS topic | `map(string)` | `{}` | no |
| subsription\_filter\_policy | (Optional) A valid filter policy that will be used in the subscription to filter messages seen by the target resource. | `string` | `null` | no |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| lambda\_cloudwatch\_log\_group\_arn | The Amazon Resource Name (ARN) specifying the log group |
| lambda\_iam\_role\_arn | The ARN of the IAM role used by Lambda function |
| lambda\_iam\_role\_name | The name of the IAM role used by Lambda function |
| notify\_slack\_lambda\_function\_arn | The ARN of the Lambda function |
| notify\_slack\_lambda\_function\_invoke\_arn | The ARN to be used for invoking Lambda function from API Gateway |
| notify\_slack\_lambda\_function\_last\_modified | The date Lambda function was last modified |
| notify\_slack\_lambda\_function\_name | The name of the Lambda function |
| notify\_slack\_lambda\_function\_version | Latest published version of your Lambda function |
| this\_slack\_topic\_arn | The ARN of the SNS topic from which messages will be sent to Slack |

## Author

* [KeisukeYamashita](https://github.com/KeisukeYamashita)

## License

Apache 2.0 Licensed. See LICENSE for full details.
