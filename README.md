<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Creates an AWS Lambda function to check that IAM Access Keys are not older than 90 days
on a scheduled interval using [truss-aws-tools](https://github.com/trussworks/truss-aws-tools).

Creates the following resources:

* IAM role for Lambda function to check age of IAM Access Keys.
* CloudWatch Event to trigger function on a schedule.
* AWS Lambda function to actually check age of IAM Access Keys and send alert to slack if any keys are older than 90 days.

## Usage

```hcl
module "iam-keys-check" {
  source  = "trussworks/iam-keys-check/aws"
  version = "1.0.0"

  environment       = "prod"
  interval_minutes  = "1440"
  s3_bucket         = "lambda-builds-us-west-2"
  version_to_deploy = "2.6"
  ssm_slack_webhook_url = "slack-webhook-url"
  slack_channel = "infra"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cloudwatch\_logs\_retention\_days | Number of days to keep logs in AWS CloudWatch. | string | `"90"` | no |
| environment | Environment tag, e.g prod. | string | n/a | yes |
| interval\_minutes | How often to check IAM Access Keys. | string | `"1440"` | no |
| s3\_bucket | The name of the S3 bucket used to store the Lambda builds. | string | n/a | yes |
| slack\_channel | Slack channel to send alert to | string | n/a | yes |
| ssm\_slack\_webhook\_url | Name of the Slack webhook url parameter in Parameter Store. | string | n/a | yes |
| version\_to\_deploy | The version the Lambda function to deploy. | string | n/a | yes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
