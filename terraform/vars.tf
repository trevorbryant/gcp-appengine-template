variable "region" {
  type = "string"
  default = "us-east1"
}

variable "project_id" {
  type = "string"
}

resource "random_string" "rails_secret_production" {
  length  = 128
  special = false
}
output "rails_secret_production" {
  value = "${random_string.rails_secret_production.result}"
  description = "Rails secret string"
  sensitive = true
}

resource "random_string" "signature_key_production" {
  length  = 128
  special = false
}
output "signature_key_production" {
  value = "${random_string.signature_key_production.result}"
  description = "production signature_key"
  sensitive = true
}

resource "random_string" "rails_secret_dev" {
  length  = 128
  special = false
}
output "rails_secret_dev" {
  value = "${random_string.rails_secret_dev.result}"
  description = "Rails Dev secret string"
  sensitive = true
}

resource "random_string" "signature_key_dev" {
  length  = 128
  special = false
}
output "signature_key_dev" {
  value = "${random_string.signature_key_dev.result}"
  description = "dev signature_key"
  sensitive = true
}

resource "random_string" "rails_secret_staging" {
  length  = 128
  special = false
}
output "rails_secret_staging" {
  value = "${random_string.rails_secret_staging.result}"
  description = "Rails staging secret string"
  sensitive = true
}

resource "random_string" "signature_key_staging" {
  length  = 128
  special = false
}
output "signature_key_staging" {
  value = "${random_string.signature_key_staging.result}"
  description = "staging signature_key"
  sensitive = true
}

# dev SSO stuff
resource "random_string" "sso_cookie_secret_dev" {
  length  = 32
}
output "sso_cookie_secret_dev" {
  value = "${random_string.sso_cookie_secret_dev.result}"
  description = "SSO cookie secret string for dev"
  sensitive = true
}

resource "tls_private_key" "sso_dev" {
  algorithm   = "RSA"
  rsa_bits = 2048
}
output "sso_key_dev" {
  value = "${tls_private_key.sso_dev.private_key_pem}"
  description = "SSO JWT key for dev"
  sensitive = true
}
resource "tls_self_signed_cert" "sso_dev" {
  key_algorithm   = "RSA"
  private_key_pem = "${tls_private_key.sso_dev.private_key_pem}"

  subject {
    common_name  = "dev"
    organization = "GSA"
  }

  validity_period_hours = 26280

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}
output "sso_cert_dev" {
  value = "${tls_self_signed_cert.sso_dev.cert_pem}"
  description = "SSO JWT cert for dev"
}

# staging SSO stuff
resource "random_string" "sso_cookie_secret_staging" {
  length  = 32
}
output "sso_cookie_secret_staging" {
  value = "${random_string.sso_cookie_secret_staging.result}"
  description = "SSO cookie secret string for staging"
  sensitive = true
}

resource "tls_private_key" "sso_staging" {
  algorithm   = "RSA"
  rsa_bits = 2048
}
output "sso_key_staging" {
  value = "${tls_private_key.sso_staging.private_key_pem}"
  description = "SSO JWT key for staging"
  sensitive = true
}
resource "tls_self_signed_cert" "sso_staging" {
  key_algorithm   = "RSA"
  private_key_pem = "${tls_private_key.sso_staging.private_key_pem}"

  subject {
    common_name  = "staging"
    organization = "GSA"
  }

  validity_period_hours = 26280

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}
output "sso_cert_staging" {
  value = "${tls_self_signed_cert.sso_staging.cert_pem}"
  description = "SSO JWT cert for staging"
}

# production SSO stuff
resource "random_string" "sso_cookie_secret_production" {
  length  = 32
}
output "sso_cookie_secret_production" {
  value = "${random_string.sso_cookie_secret_production.result}"
  description = "SSO cookie secret string for production"
  sensitive = true
}

resource "tls_private_key" "sso_production" {
  algorithm   = "RSA"
  rsa_bits = 2048
}
output "sso_key_production" {
  value = "${tls_private_key.sso_production.private_key_pem}"
  description = "SSO JWT key for production"
  sensitive = true
}
resource "tls_self_signed_cert" "sso_production" {
  key_algorithm   = "RSA"
  private_key_pem = "${tls_private_key.sso_production.private_key_pem}"

  subject {
    common_name  = "production"
    organization = "GSA"
  }

  validity_period_hours = 26280

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}
output "sso_cert_production" {
  value = "${tls_self_signed_cert.sso_production.cert_pem}"
  description = "SSO JWT cert for production"
}
