output "cdn_frontdoor_security_policies_id" {
  description = "Map of id values across all cdn_frontdoor_security_policies, keyed the same as var.cdn_frontdoor_security_policies"
  value       = { for k, v in azurerm_cdn_frontdoor_security_policy.cdn_frontdoor_security_policies : k => v.id if v.id != null && length(v.id) > 0 }
}
output "cdn_frontdoor_security_policies_cdn_frontdoor_profile_id" {
  description = "Map of cdn_frontdoor_profile_id values across all cdn_frontdoor_security_policies, keyed the same as var.cdn_frontdoor_security_policies"
  value       = { for k, v in azurerm_cdn_frontdoor_security_policy.cdn_frontdoor_security_policies : k => v.cdn_frontdoor_profile_id if v.cdn_frontdoor_profile_id != null && length(v.cdn_frontdoor_profile_id) > 0 }
}
output "cdn_frontdoor_security_policies_name" {
  description = "Map of name values across all cdn_frontdoor_security_policies, keyed the same as var.cdn_frontdoor_security_policies"
  value       = { for k, v in azurerm_cdn_frontdoor_security_policy.cdn_frontdoor_security_policies : k => v.name if v.name != null && length(v.name) > 0 }
}
output "cdn_frontdoor_security_policies_security_policies" {
  description = "Map of security_policies values across all cdn_frontdoor_security_policies, keyed the same as var.cdn_frontdoor_security_policies"
  value       = { for k, v in azurerm_cdn_frontdoor_security_policy.cdn_frontdoor_security_policies : k => v.security_policies if v.security_policies != null && length(v.security_policies) > 0 }
}

