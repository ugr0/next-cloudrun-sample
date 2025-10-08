terraform {
  backend "gcs" {
    bucket = "token-cms-tfstate-bucket"
    prefix = "token-cms-dev"
  }
}
