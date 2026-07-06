output "cdn_frontdoor_security_policies" {
  description = "All cdn_frontdoor_security_policy resources"
  value       = azurerm_cdn_frontdoor_security_policy.cdn_frontdoor_security_policies
}
output "cdn_frontdoor_security_policies_cdn_frontdoor_profile_id" {
  description = "List of cdn_frontdoor_profile_id values across all cdn_frontdoor_security_policies"
  value       = [for k, v in azurerm_cdn_frontdoor_security_policy.cdn_frontdoor_security_policies : v.cdn_frontdoor_profile_id]
}
output "cdn_frontdoor_security_policies_name" {
  description = "List of name values across all cdn_frontdoor_security_policies"
  value       = [for k, v in azurerm_cdn_frontdoor_security_policy.cdn_frontdoor_security_policies : v.name]
}
output "cdn_frontdoor_security_policies_security_policies" {
  description = "List of security_policies values across all cdn_frontdoor_security_policies"
  value       = [for k, v in azurerm_cdn_frontdoor_security_policy.cdn_frontdoor_security_policies : v.security_policies]
}

