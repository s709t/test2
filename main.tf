provider "aws" {
  region     = "us-west-2"
}

resource "aws_s3_bucket" "bucket_object" {
  bucket = var.bucket
  acl    = "private"
  tags = {
    Name        = var.bucket
    Environment = "Dev"
  }
}
resource "null_resource" "create_files" {
  provisioner "local-exec" {
    command = "python3 files.py"
  }
}

resource "aws_s3_bucket_object" "upload_files" {
  bucket = aws_s3_bucket.bucket_object.bucket
  for_each = fileset( path.module,"*.txt")
  key    = each.value
  source = "${path.module}/${each.value}"
}

