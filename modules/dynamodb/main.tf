resource "aws_dynamodb_table" "appointments" {
  name         = "Appointments"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "insuredId"
  range_key    = "scheduleId"

  attribute {
    name = "insuredId"
    type = "S"
  }

  attribute {
    name = "scheduleId"
    type = "N"
  }

  attribute {
    name = "countryISO"
    type = "S"
  }

  global_secondary_index {
    name            = "countryISO-index"
    hash_key        = "countryISO"
    projection_type = "ALL"
  }
}

output "table_name" {
  value = aws_dynamodb_table.appointments.name
}
