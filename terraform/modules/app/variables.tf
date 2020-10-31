variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default = "reddit-app-base"
}
variable subnet_id {
description = "Subnets for modules"
}
variable database_url {
  description = "MongoDB url"
}
variable private_key {
  description = "Path to private key, used for connect via ssh"
  default = "~/.ssh/appuser"
}
variable instance_name {
  description = "Instance name"
}
