module "dynamodb" {
  source = "./modules/dynamodb"
}

module "sns" {
  source = "./modules/sns"
}

module "sqs" {
  source        = "./modules/sqs"
  sns_topic_arn = module.sns.topic_arn
}

module "eventbridge" {
  source         = "./modules/eventbridge"
  target_sqs_arn = module.sqs.sqs_arn
}
