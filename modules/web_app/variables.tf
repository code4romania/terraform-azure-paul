variable "docker_tag" {
  description = "Docker image tag"
  type        = string
}

variable "project_slug" {
  description = "Project slug"
  type        = string
}

variable "hostname" {
  description = "Domain for web app"
  type        = string
}

variable "env" {
  description = "Environment"
  type        = string
}

variable "debug_mode" {
  description = "Is debug mode enabled"
  type        = bool
}

variable "region" {
  description = "Region where to deploy resources"
  type        = string
}

variable "mail_host" {
  description = "SMTP host"
  type        = string
}

variable "mail_port" {
  description = "SMTP port"
  type        = string
}

variable "mail_username" {
  description = "SMTP username"
  type        = string
}

variable "mail_password" {
  description = "SMTP password"
  type        = string
}

variable "mail_encryption" {
  description = "SMTP encryption"
  type        = bool
}

variable "mail_from_address" {
  description = "Mail from address"
  type        = string
}

variable "admin_email" {
  description = "Email address of initial admin account"
  type        = string
}

variable "worker_timeout" {
  description = "The maximum time in seconds that a worker can run"
  type        = number
  default     = 1200
}

variable "mailchimp_key" {
  description = "Enables support for mailchimp plugin"
  type        = string
}

variable "database_az_enabled" {
  description = "Specifies if there's a preference for the Availability Zone in which the PostgreSQL Flexible Server should be located"
  type        = bool
}

variable "database_az" {
  description = "Specifies the Availability Zone in which the PostgreSQL Flexible Server should be located"
  type        = string
}
