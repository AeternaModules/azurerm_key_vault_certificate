output "key_vault_certificates" {
  description = "All key_vault_certificate resources"
  value       = azurerm_key_vault_certificate.key_vault_certificates
  sensitive   = true
}
output "key_vault_certificates_certificate" {
  description = "List of certificate values across all key_vault_certificates"
  value       = [for k, v in azurerm_key_vault_certificate.key_vault_certificates : v.certificate]
  sensitive   = true
}
output "key_vault_certificates_certificate_attribute" {
  description = "List of certificate_attribute values across all key_vault_certificates"
  value       = [for k, v in azurerm_key_vault_certificate.key_vault_certificates : v.certificate_attribute]
}
output "key_vault_certificates_certificate_data" {
  description = "List of certificate_data values across all key_vault_certificates"
  value       = [for k, v in azurerm_key_vault_certificate.key_vault_certificates : v.certificate_data]
}
output "key_vault_certificates_certificate_data_base64" {
  description = "List of certificate_data_base64 values across all key_vault_certificates"
  value       = [for k, v in azurerm_key_vault_certificate.key_vault_certificates : v.certificate_data_base64]
}
output "key_vault_certificates_certificate_policy" {
  description = "List of certificate_policy values across all key_vault_certificates"
  value       = [for k, v in azurerm_key_vault_certificate.key_vault_certificates : v.certificate_policy]
}
output "key_vault_certificates_key_vault_id" {
  description = "List of key_vault_id values across all key_vault_certificates"
  value       = [for k, v in azurerm_key_vault_certificate.key_vault_certificates : v.key_vault_id]
}
output "key_vault_certificates_name" {
  description = "List of name values across all key_vault_certificates"
  value       = [for k, v in azurerm_key_vault_certificate.key_vault_certificates : v.name]
}
output "key_vault_certificates_resource_manager_id" {
  description = "List of resource_manager_id values across all key_vault_certificates"
  value       = [for k, v in azurerm_key_vault_certificate.key_vault_certificates : v.resource_manager_id]
}
output "key_vault_certificates_resource_manager_versionless_id" {
  description = "List of resource_manager_versionless_id values across all key_vault_certificates"
  value       = [for k, v in azurerm_key_vault_certificate.key_vault_certificates : v.resource_manager_versionless_id]
}
output "key_vault_certificates_secret_id" {
  description = "List of secret_id values across all key_vault_certificates"
  value       = [for k, v in azurerm_key_vault_certificate.key_vault_certificates : v.secret_id]
}
output "key_vault_certificates_tags" {
  description = "List of tags values across all key_vault_certificates"
  value       = [for k, v in azurerm_key_vault_certificate.key_vault_certificates : v.tags]
}
output "key_vault_certificates_thumbprint" {
  description = "List of thumbprint values across all key_vault_certificates"
  value       = [for k, v in azurerm_key_vault_certificate.key_vault_certificates : v.thumbprint]
}
output "key_vault_certificates_version" {
  description = "List of version values across all key_vault_certificates"
  value       = [for k, v in azurerm_key_vault_certificate.key_vault_certificates : v.version]
}
output "key_vault_certificates_versionless_id" {
  description = "List of versionless_id values across all key_vault_certificates"
  value       = [for k, v in azurerm_key_vault_certificate.key_vault_certificates : v.versionless_id]
}
output "key_vault_certificates_versionless_secret_id" {
  description = "List of versionless_secret_id values across all key_vault_certificates"
  value       = [for k, v in azurerm_key_vault_certificate.key_vault_certificates : v.versionless_secret_id]
}

