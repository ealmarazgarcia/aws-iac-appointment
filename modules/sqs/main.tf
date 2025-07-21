variable "sns_topic_arn" {}

resource "aws_sqs_queue" "sqs_pe" {
  name = "sqs_pe"
}

resource "aws_sqs_queue" "sqs_cl" {
  name = "sqs_cl"
}

resource "aws_sqs_queue" "sqs" {
  name = "sqs"
}

resource "aws_sns_topic_subscription" "pe_subscription" {
  topic_arn = var.sns_topic_arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.sqs_pe.arn

  filter_policy = jsonencode({
    countryISO = ["PE"]
  })
}

resource "aws_sns_topic_subscription" "cl_subscription" {
  topic_arn = var.sns_topic_arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.sqs_cl.arn

  filter_policy = jsonencode({
    countryISO = ["CL"]
  })
}

output "sqs_arn" {
  value = aws_sqs_queue.sqs.arn
}

output "sqs_cl_arn" {
  value = aws_sqs_queue.sqs_cl.arn
}

output "sqs_pe_arn" {
  value = aws_sqs_queue.sqs_pe.arn
}
