module "web_app" {
  source = "./modules/web_app"

  # Input Variables
  docker_tag        = var.docker_tag
  hostname          = var.hostname
  env               = var.env
  project_slug      = var.project_slug
  region            = var.region
  debug_mode        = var.debug_mode
  mail_host         = var.mail_host
  mail_port         = var.mail_port
  mail_username     = var.mail_username
  mail_password     = var.mail_password
  mail_encryption   = var.mail_encryption
  mail_from_address = var.mail_from_address
  admin_email       = var.admin_email
  worker_timeout    = var.worker_timeout
  mailchimp_key     = var.mailchimp_key

  database_az_enabled = var.database_az_enabled
  database_az         = var.database_az
}
