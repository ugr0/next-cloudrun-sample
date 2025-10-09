terraform {
  backend "gcs" {
    bucket = "dev-aeon-token-cms-tfstate"
    prefix = "dev-token-cms"
  }
}
