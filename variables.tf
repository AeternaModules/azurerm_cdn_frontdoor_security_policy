variable "cdn_frontdoor_security_policies" {
  description = <<EOT
Map of cdn_frontdoor_security_policies, attributes below
Required:
    - cdn_frontdoor_profile_id
    - name
    - security_policies (block):
        - firewall (required, block):
            - association (required, block):
                - domain (required, block):
                    - cdn_frontdoor_domain_id (required)
                - patterns_to_match (required)
            - cdn_frontdoor_firewall_policy_id (required)
EOT

  type = map(object({
    cdn_frontdoor_profile_id = string
    name                     = string
    security_policies = object({
      firewall = object({
        association = object({
          domain = list(object({
            cdn_frontdoor_domain_id = string
          }))
          patterns_to_match = list(string)
        })
        cdn_frontdoor_firewall_policy_id = string
      })
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_security_policies : (
        length(v.security_policies.firewall.association.domain) <= 500
      )
    ])
    error_message = "Each domain list must contain at most 500 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_security_policies : (
        contains(["/*"], v.security_policies.firewall.association.patterns_to_match)
      )
    ])
    error_message = "must be one of: /*"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_cdn_frontdoor_security_policy's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    validate.FrontDoorSecurityPolicyName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: cdn_frontdoor_profile_id
  #   source:    [from validate.FrontDoorProfileID] !ok
  # path: cdn_frontdoor_profile_id
  #   source:    [from validate.FrontDoorProfileID] err != nil
  # path: security_policies.firewall.cdn_frontdoor_firewall_policy_id
  #   source:    [from validate.FrontDoorFirewallPolicyID] !ok
  # path: security_policies.firewall.cdn_frontdoor_firewall_policy_id
  #   source:    [from validate.FrontDoorFirewallPolicyID] err != nil
  # path: security_policies.firewall.association.domain.cdn_frontdoor_domain_id
  #   source:    validate.FrontDoorSecurityPolicyDomainID: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
}

