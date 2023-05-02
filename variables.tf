variable "docker_tag" {
  description = "Docker image tag"
  type        = string
  default     = "1.1.7"
}

variable "project_slug" {
  description = "Project slug"
  type        = string
}

variable "hostname" {
  description = "Domain for web app"
  type        = string
  default     = null
}

variable "env" {
  description = "Environment"
  type        = string
  default     = "production"
}

variable "debug_mode" {
  description = "Enable debug mode"
  type        = bool
  default     = false
}

variable "region" {
  description = "Region where to deploy resources"
  type        = string
  default     = "North Europe"
}

variable "mail_host" {
  description = "SMTP host"
  type        = string
  default     = "smtp.sendgrid.net"
}

variable "mail_port" {
  description = "SMTP port"
  type        = string
  default     = 587
}

variable "mail_username" {
  description = "SMTP username"
  type        = string
  default     = "apikey"
}

variable "mail_password" {
  description = "SMTP password"
  type        = string
  sensitive   = true
}

variable "mail_encryption" {
  description = "SMTP encryption"
  type        = bool
  default     = true
}

variable "mail_from_address" {
  description = "Mail from address"
  type        = string
}

variable "admin_email" {
  description = "Email address of initial admin account"
  type        = string
}

variable "mailchimp_key" {
  description = "Enables support for mailchimp plugin"
  type        = string
  default     = null
}
