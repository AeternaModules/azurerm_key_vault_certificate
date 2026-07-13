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
  # --- Unconfirmed validation candidates, derived from azurerm_key_vault_certificate's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from keyvault.ValidateNestedItemName] !ok
  # path: name
  #   condition: length(value) <= 127
  #   message:   [from keyvault.ValidateNestedItemName: invalid when len(value) > 127]
  #   source:    [from keyvault.ValidateNestedItemName: invalid when len(value) > 127]
  # path: name
  #   source:    [from keyvault.ValidateNestedItemName] !regexp.MustCompile(`^[0-9a-zA-Z-]+$`).MatchString(v.(string))
  # path: key_vault_id
  #   source:    [from validationFunctionForResourceID] !ok
  # path: key_vault_id
  #   source:    [from validationFunctionForResourceID] err != nil
  # path: certificate.contents
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: certificate_policy.key_properties.curve
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: certificate_policy.key_properties.key_size
  #   source:    validation.IntInSlice(...) - no translation rule yet, add one
  # path: certificate_policy.key_properties.key_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: certificate_policy.lifetime_action.action.action_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: certificate_policy.x509_certificate_properties.extended_key_usage[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: certificate_policy.x509_certificate_properties.key_usage[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

