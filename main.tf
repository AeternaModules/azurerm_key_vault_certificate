resource "azurerm_key_vault_certificate" "key_vault_certificates" {
  for_each = var.key_vault_certificates

  key_vault_id = each.value.key_vault_id
  name         = each.value.name
  tags         = each.value.tags

  dynamic "certificate" {
    for_each = each.value.certificate != null ? [each.value.certificate] : []
    content {
      contents = certificate.value.contents
      password = certificate.value.password
    }
  }

  dynamic "certificate_policy" {
    for_each = each.value.certificate_policy != null ? [each.value.certificate_policy] : []
    content {
      issuer_parameters {
        name = certificate_policy.value.issuer_parameters.name
      }
      key_properties {
        curve      = certificate_policy.value.key_properties.curve
        exportable = certificate_policy.value.key_properties.exportable
        key_size   = certificate_policy.value.key_properties.key_size
        key_type   = certificate_policy.value.key_properties.key_type
        reuse_key  = certificate_policy.value.key_properties.reuse_key
      }
      dynamic "lifetime_action" {
        for_each = certificate_policy.value.lifetime_action != null ? certificate_policy.value.lifetime_action : []
        content {
          action {
            action_type = lifetime_action.value.action.action_type
          }
          trigger {
            days_before_expiry  = lifetime_action.value.trigger.days_before_expiry
            lifetime_percentage = lifetime_action.value.trigger.lifetime_percentage
          }
        }
      }
      secret_properties {
        content_type = certificate_policy.value.secret_properties.content_type
      }
      dynamic "x509_certificate_properties" {
        for_each = certificate_policy.value.x509_certificate_properties != null ? [certificate_policy.value.x509_certificate_properties] : []
        content {
          extended_key_usage = x509_certificate_properties.value.extended_key_usage
          key_usage          = x509_certificate_properties.value.key_usage
          subject            = x509_certificate_properties.value.subject
          dynamic "subject_alternative_names" {
            for_each = x509_certificate_properties.value.subject_alternative_names != null ? [x509_certificate_properties.value.subject_alternative_names] : []
            content {
              dns_names = subject_alternative_names.value.dns_names
              emails    = subject_alternative_names.value.emails
              upns      = subject_alternative_names.value.upns
            }
          }
          validity_in_months = x509_certificate_properties.value.validity_in_months
        }
      }
    }
  }
}

