variable "cdn_frontdoor_security_policys" {
  description = <<EOT
Map of cdn_frontdoor_security_policys, attributes below
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
      for k, v in var.cdn_frontdoor_security_policys : (
        length(v.security_policies.firewall.association.domain) <= 500
      )
    ])
    error_message = "Each domain list must contain at most 500 items"
  }
}

