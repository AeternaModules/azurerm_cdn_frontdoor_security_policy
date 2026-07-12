output "cdn_frontdoor_security_policies_cdn_frontdoor_profile_id" {
  description = "Map of cdn_frontdoor_profile_id values across all cdn_frontdoor_security_policies, keyed the same as var.cdn_frontdoor_security_policies"
  value       = { for k, v in azurerm_cdn_frontdoor_security_policy.cdn_frontdoor_security_policies : k => v.cdn_frontdoor_profile_id }
}
output "cdn_frontdoor_security_policies_name" {
  description = "Map of name values across all cdn_frontdoor_security_policies, keyed the same as var.cdn_frontdoor_security_policies"
  value       = { for k, v in azurerm_cdn_frontdoor_security_policy.cdn_frontdoor_security_policies : k => v.name }
}
output "cdn_frontdoor_security_policies_security_policies" {
  description = "Map of security_policies values across all cdn_frontdoor_security_policies, keyed the same as var.cdn_frontdoor_security_policies"
  value       = { for k, v in azurerm_cdn_frontdoor_security_policy.cdn_frontdoor_security_policies : k => v.security_policies }
}

