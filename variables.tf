variable "cloudwatch_logs_retention_days" {
  default     = 90
  description = "Number of days to keep logs in AWS CloudWatch."
  type        = "string"
}

variable "doc_url" {
  default     = "https://example.com"
  description = "URL for documentation on how to rotate keys."
  type        = "string"
}

variable "interval_minutes" {
  default     = 1440
  description = "How often to check IAM Access Keys."
  type        = "string"
}

variable "s3_bucket" {
  description = "The name of the S3 bucket used to store the Lambda builds."
  type        = "string"
}

variable "version_to_deploy" {
  description = "The version the Lambda function to deploy."
  type        = "string"
}

variable "ssm_slack_webhook_url" {
  description = "Name of the Slack webhook url parameter in Parameter Store."
  type        = "string"
}

variable "slack_channel" {
  description = "Slack channel to send alert to"
  type        = "string"
}

variable "tags" {
  default     = {}
  description = "Map of additional tags to apply to resources; 'Name' tag automatically applied."
  type        = map(string)
}
