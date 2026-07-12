output "key_vault_certificates_certificate" {
  description = "Map of certificate values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.certificate }
  sensitive   = true
}
output "key_vault_certificates_certificate_attribute" {
  description = "Map of certificate_attribute values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.certificate_attribute }
}
output "key_vault_certificates_certificate_data" {
  description = "Map of certificate_data values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.certificate_data }
}
output "key_vault_certificates_certificate_data_base64" {
  description = "Map of certificate_data_base64 values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.certificate_data_base64 }
}
output "key_vault_certificates_certificate_policy" {
  description = "Map of certificate_policy values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.certificate_policy }
}
output "key_vault_certificates_key_vault_id" {
  description = "Map of key_vault_id values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.key_vault_id }
}
output "key_vault_certificates_name" {
  description = "Map of name values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.name }
}
output "key_vault_certificates_resource_manager_id" {
  description = "Map of resource_manager_id values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.resource_manager_id }
}
output "key_vault_certificates_resource_manager_versionless_id" {
  description = "Map of resource_manager_versionless_id values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.resource_manager_versionless_id }
}
output "key_vault_certificates_secret_id" {
  description = "Map of secret_id values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.secret_id }
}
output "key_vault_certificates_tags" {
  description = "Map of tags values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.tags }
}
output "key_vault_certificates_thumbprint" {
  description = "Map of thumbprint values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.thumbprint }
}
output "key_vault_certificates_version" {
  description = "Map of version values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.version }
}
output "key_vault_certificates_versionless_id" {
  description = "Map of versionless_id values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.versionless_id }
}
output "key_vault_certificates_versionless_secret_id" {
  description = "Map of versionless_secret_id values across all key_vault_certificates, keyed the same as var.key_vault_certificates"
  value       = { for k, v in azurerm_key_vault_certificate.key_vault_certificates : k => v.versionless_secret_id }
}

