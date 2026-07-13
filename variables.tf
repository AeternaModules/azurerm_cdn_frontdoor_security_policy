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
        length(v.security_policies.firewall.association.domain) >= 1 && length(v.security_policies.firewall.association.domain) <= 500
      )
    ])
    error_message = "Each domain list must contain between 1 and 500 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_security_policies : (
        alltrue([for x in v.security_policies.firewall.association.patterns_to_match : contains(["/*"], x)])
      )
    ])
    error_message = "must be one of: /*"
  }
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

