variable "target_sqs_arn" {}

resource "aws_cloudwatch_event_rule" "appointment_rule" {
  name          = "appointment-rule"
  event_pattern = <<EOF
{
  "source": ["appointment.system"]
}
EOF
}

resource "aws_cloudwatch_event_target" "send_to_sqs" {
  rule      = aws_cloudwatch_event_rule.appointment_rule.name
  target_id = "sendToSQS"
  arn       = var.target_sqs_arn
}
