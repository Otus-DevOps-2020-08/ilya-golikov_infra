terraform {
  backend "s3" {
    endpoint = "storage.yandexcloud.net"
    bucket   = "otus-terraform-state"
    region   = "ru-central1"
    key      = "stage/terraform.tfstate"
    access_key  = "acess_key"
    secret_key  = "secret_key"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
