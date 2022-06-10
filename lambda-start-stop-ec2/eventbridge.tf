resource "aws_cloudwatch_event_rule" "ec2-rule" {
  name        = "ec2-rule"
  description = "Trigger Stop Instance every 5 min"
  schedule_expression = "rate(5 minutes)"
}

resource "aws_cloudwatch_event_target" "lambda-func" {
  rule      = aws_cloudwatch_event_rule.ec2-rule.name
  target_id = "lambda"
  arn       = aws_lambda_function.auto_lambda.arn
}

# resource "aws_lambda_permission" "allow_cloudwatch" {
#   statement_id  = "AllowExecutionFromCloudWatch"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.auto_lambda.function_name
#   principal     = "events.amazonaws.com"
#   source_arn    = aws_cloudwatch_event_rule.ec2-rule.arn
# }