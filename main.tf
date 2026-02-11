resource "azurerm_cdn_frontdoor_security_policy" "cdn_frontdoor_security_policies" {
  for_each = var.cdn_frontdoor_security_policies

  cdn_frontdoor_profile_id = each.value.cdn_frontdoor_profile_id
  name                     = each.value.name

  security_policies {
    firewall {
      association {
        dynamic "domain" {
          for_each = each.value.security_policies.firewall.association.domain
          content {
            cdn_frontdoor_domain_id = domain.value.cdn_frontdoor_domain_id
          }
        }
        patterns_to_match = each.value.security_policies.firewall.association.patterns_to_match
      }
      cdn_frontdoor_firewall_policy_id = each.value.security_policies.firewall.cdn_frontdoor_firewall_policy_id
    }
  }
}

