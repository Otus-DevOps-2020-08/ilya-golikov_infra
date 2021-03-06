provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}
module "vpc" {
  source          = "../modules/vpc"
  public_key_path = var.public_key_path
}

module "app" {
  source          = "../modules/app"
  public_key_path = var.public_key_path
  app_disk_image  = var.app_disk_image
  subnet_id        = module.vpc.subnet_id
  database_url    = module.db.internal_ip_address_db
  instance_name = var.app_instance_name
}

module "db" {
  source          = "../modules/db"
  public_key_path = var.public_key_path
  db_disk_image   = var.db_disk_image
  subnet_id        = module.vpc.subnet_id
  instance_name = var.db_instance_name
}
