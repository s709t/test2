provider "aws" {
  region     = "us-west-2"
}

resource "aws_s3_bucket" "new_bucket" {
  bucket = var.bucket
  acl    = "private"
  tags = {
    Name        = var.bucket
    Environment = "Dev"
  }
}

resource "local_file" "create_files" {
    count = var.counter_files
    content     = timestamp()
    filename = "file${count.index+1}.txt"
}

resource "aws_s3_bucket_object" "upload_files" {
  bucket = aws_s3_bucket.new_bucket.bucket
  for_each = fileset(path.module, "*.txt")
  key    = each.value
  source = "${path.module}/${each.value}"
}

