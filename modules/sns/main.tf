resource "aws_sns_topic" "appointment_topic" {
  name = "appointment-topic"
}

output "topic_arn" {
  value = aws_sns_topic.appointment_topic.arn
}
