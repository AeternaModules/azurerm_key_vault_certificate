output "key_vault_certificates_id" {
  description = "Map of id values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.id if v.id != null && length(v.id) > 0 }
}
output "key_vault_certificates_certificate" {
  description = "Map of certificate values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.certificate if v.certificate != null && length(v.certificate) > 0 }
  sensitive   = true
}
output "key_vault_certificates_certificate_attribute" {
  description = "Map of certificate_attribute values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.certificate_attribute if v.certificate_attribute != null && length(v.certificate_attribute) > 0 }
}
output "key_vault_certificates_certificate_data" {
  description = "Map of certificate_data values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.certificate_data if v.certificate_data != null && length(v.certificate_data) > 0 }
}
output "key_vault_certificates_certificate_data_base64" {
  description = "Map of certificate_data_base64 values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.certificate_data_base64 if v.certificate_data_base64 != null && length(v.certificate_data_base64) > 0 }
}
output "key_vault_certificates_certificate_policy" {
  description = "Map of certificate_policy values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.certificate_policy if v.certificate_policy != null && length(v.certificate_policy) > 0 }
}
output "key_vault_certificates_key_vault_id" {
  description = "Map of key_vault_id values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.key_vault_id if v.key_vault_id != null && length(v.key_vault_id) > 0 }
}
output "key_vault_certificates_name" {
  description = "Map of name values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.name if v.name != null && length(v.name) > 0 }
}
output "key_vault_certificates_resource_manager_id" {
  description = "Map of resource_manager_id values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.resource_manager_id if v.resource_manager_id != null && length(v.resource_manager_id) > 0 }
}
output "key_vault_certificates_resource_manager_versionless_id" {
  description = "Map of resource_manager_versionless_id values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.resource_manager_versionless_id if v.resource_manager_versionless_id != null && length(v.resource_manager_versionless_id) > 0 }
}
output "key_vault_certificates_secret_id" {
  description = "Map of secret_id values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.secret_id if v.secret_id != null && length(v.secret_id) > 0 }
}
output "key_vault_certificates_tags" {
  description = "Map of tags values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "key_vault_certificates_thumbprint" {
  description = "Map of thumbprint values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.thumbprint if v.thumbprint != null && length(v.thumbprint) > 0 }
}
output "key_vault_certificates_version" {
  description = "Map of version values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.version if v.version != null && length(v.version) > 0 }
}
output "key_vault_certificates_versionless_id" {
  description = "Map of versionless_id values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.versionless_id if v.versionless_id != null && length(v.versionless_id) > 0 }
}
output "key_vault_certificates_versionless_secret_id" {
  description = "Map of versionless_secret_id values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.versionless_secret_id if v.versionless_secret_id != null && length(v.versionless_secret_id) > 0 }
}

