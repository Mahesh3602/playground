resource "aws_s3_bucket" "terraform-on-aws-eks" {
  bucket = "terraform-on-aws-eks-3602"

  tags = {
    Name        = "terraform-on-aws-eks"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "terraform-on-aws-eks" {
  bucket = aws_s3_bucket.terraform-on-aws-eks.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "terraform-on-aws-eks" {
  bucket = aws_s3_bucket.terraform-on-aws-eks.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_object" "folder1" {
    bucket = "${aws_s3_bucket.terraform-on-aws-eks.id}"
    acl    = "private"
    key    = "dev/eks-cluster/"
    //source = "/dev/null"
}

resource "aws_s3_bucket_object" "folder2" {
    bucket = "${aws_s3_bucket.terraform-on-aws-eks.id}"
    acl    = "private"
    key    = "dev/app1k8s/"
    //source = "/dev/app1k8s/"
}
