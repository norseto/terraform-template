resource "aws_dynamodb_table" "main" {
  name         = var.backend_lock
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
