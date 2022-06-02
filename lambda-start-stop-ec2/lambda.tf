locals{
    lambda_zip_location = "outputs/copy.zip"
}

data "archive_file" "copy" {
  type        = "zip"
  source_file = "AutoStopEC2.py"
  output_path = "${local.lambda_zip_location}"
}

resource "aws_lambda_function" "auto_lambda" {
  filename      = "${local.lambda_zip_location}"
  function_name = "auto_lambda"
  role          = "${aws_iam_role.lambda_ec2_role.arn}"
  handler       = "AutoStopEC2.lambda_handler"


  #source_code_hash = filebase64sha256("lambda_function_payload.zip")

  runtime = "python3.7"
  timeout = 120
  
}