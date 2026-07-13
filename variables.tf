variable "key_vault_certificates" {
  description = <<EOT
Map of key_vault_certificates, attributes below
Required:
    - key_vault_id
    - name
Optional:
    - tags
    - certificate (block):
        - contents (required)
        - password (optional)
    - certificate_policy (block):
        - issuer_parameters (required, block):
            - name (required)
        - key_properties (required, block):
            - curve (optional)
            - exportable (required)
            - key_size (optional)
            - key_type (required)
            - reuse_key (required)
        - lifetime_action (optional, block):
            - action (required, block):
                - action_type (required)
            - trigger (required, block):
                - days_before_expiry (optional)
                - lifetime_percentage (optional)
        - secret_properties (required, block):
            - content_type (required)
        - x509_certificate_properties (optional, block):
            - extended_key_usage (optional)
            - key_usage (required)
            - subject (required)
            - subject_alternative_names (optional, block):
                - dns_names (optional)
                - emails (optional)
                - upns (optional)
            - validity_in_months (required)
EOT

  type = map(object({
    key_vault_id = string
    name         = string
    tags         = optional(map(string))
    certificate = optional(object({
      contents = string
      password = optional(string)
    }))
    certificate_policy = optional(object({
      issuer_parameters = object({
        name = string
      })
      key_properties = object({
        curve      = optional(string)
        exportable = bool
        key_size   = optional(number)
        key_type   = string
        reuse_key  = bool
      })
      lifetime_action = optional(list(object({
        action = object({
          action_type = string
        })
        trigger = object({
          days_before_expiry  = optional(number)
          lifetime_percentage = optional(number)
        })
      })))
      secret_properties = object({
        content_type = string
      })
      x509_certificate_properties = optional(object({
        extended_key_usage = optional(list(string))
        key_usage          = set(string)
        subject            = string
        subject_alternative_names = optional(object({
          dns_names = optional(set(string))
          emails    = optional(set(string))
          upns      = optional(set(string))
        }))
        validity_in_months = number
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.key_vault_certificates : (
        length(v.name) <= 127
      )
    ])
    error_message = "[from keyvault.ValidateNestedItemName: invalid when len(value) > 127]"
  }
  validation {
    condition = alltrue([
      for k, v in var.key_vault_certificates : (
        v.certificate == null || (length(v.certificate.contents) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.key_vault_certificates : (
        v.certificate_policy == null || (v.certificate_policy.key_properties.key_size == null || (contains([256, 384, 521, 2048, 3072, 4096], v.certificate_policy.key_properties.key_size)))
      )
    ])
    error_message = "must be one of: 256, 384, 521, 2048, 3072, 4096"
  }
  validation {
    condition = alltrue([
      for k, v in var.key_vault_certificates : (
        v.certificate_policy == null || (v.certificate_policy.x509_certificate_properties == null || (v.certificate_policy.x509_certificate_properties.extended_key_usage == null || (alltrue([for x in v.certificate_policy.x509_certificate_properties.extended_key_usage : length(x) > 0]))))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.key_vault_certificates : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 11 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

