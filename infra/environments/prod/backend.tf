terraform {
  backend "gcs" {
    bucket = "prod-aeon-token-cms-tfstate"
    prefix = "prod-token-cms"
  }
}
