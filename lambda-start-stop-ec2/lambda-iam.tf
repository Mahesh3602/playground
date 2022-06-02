resource "aws_iam_role" "lambda_ec2_role" {
  name = "lambda_ec2_role"
  assume_role_policy = "${file("iam-policy/lambda-assume-policy.json")}"

  tags = {
    CreatedBy = "Mahesh"
  }
}

resource "aws_iam_role_policy" "lambda_ec2_policy" {
  name = "lambda_ec2_policy"
  role = aws_iam_role.lambda_ec2_role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = "${file("iam-policy/lambda-policy.json")}"
}
