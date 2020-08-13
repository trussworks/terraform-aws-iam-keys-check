Creates an AWS Lambda function to check that IAM Access Keys are not older than 90 days
on a scheduled interval using [truss-aws-tools](https://github.com/trussworks/truss-aws-tools).

Creates the following resources:

* IAM role for Lambda function to check age of IAM Access Keys.
* CloudWatch Event to trigger function on a schedule.
* AWS Lambda function to actually check age of IAM Access Keys and send alert to slack if any keys are older than 90 days.

## Terraform Versions

Terraform 0.12: Pin module to ~> 2.0. Submit pull-requests to `master` branch.

Terraform 0.11: Pin module to ~> 1.0. Submit pull-requests to `terraform011` branch.

## Usage

```hcl
module "iam-keys-check" {
  source  = "trussworks/iam-keys-check/aws"
  version = "2.0.0"

  interval_minutes  = "1440"
  s3_bucket         = "lambda-builds-us-west-2"
  version_to_deploy = "2.8"
  ssm_slack_webhook_url = "slack-webhook-url"
  slack_channel = "infra"

  tags = {
    Owner = "infra"
  }
}
```

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
  version = "2.0.0"

  interval_minutes  = "1440"
  s3_bucket         = "lambda-builds-us-west-2"
  version_to_deploy = "2.8"
  ssm_slack_webhook_url = "slack-webhook-url"
  slack_channel = "infra"

  tags = {
    Owner = "infra"
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12.0 |
| aws | ~> 2.70 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.70 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cloudwatch\_logs\_retention\_days | Number of days to keep logs in AWS CloudWatch. | `string` | `90` | no |
| doc\_url | URL for documentation on how to rotate keys. | `string` | `"https://example.com"` | no |
| interval\_minutes | How often to check IAM Access Keys. | `string` | `1440` | no |
| s3\_bucket | The name of the S3 bucket used to store the Lambda builds. | `string` | n/a | yes |
| slack\_channel | Slack channel to send alert to | `string` | n/a | yes |
| ssm\_slack\_webhook\_url | Name of the Slack webhook url parameter in Parameter Store. | `string` | n/a | yes |
| tags | Map of additional tags to apply to resources; 'Name' tag automatically applied. | `map(string)` | `{}` | no |
| version\_to\_deploy | The version the Lambda function to deploy. | `string` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
