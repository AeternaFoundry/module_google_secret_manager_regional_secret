variable "secret_manager_regional_secrets" {
  description = <<EOT
Map of secret_manager_regional_secrets, attributes below
Required:
    - location
    - secret_id
Optional:
    - annotations
    - deletion_policy
    - deletion_protection
    - expire_time
    - labels
    - project
    - secret_type
    - tags
    - ttl
    - version_aliases
    - version_destroy_ttl
    - customer_managed_encryption (block):
        - kms_key_name (required)
    - rotation (block):
        - next_rotation_time (optional)
        - rotation_period (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
    - topics (block):
        - name (required)
EOT

  type = map(object({
    location            = string
    secret_id           = string
    annotations         = optional(map(string))
    deletion_policy     = optional(string)
    deletion_protection = optional(bool)
    expire_time         = optional(string)
    labels              = optional(map(string))
    project             = optional(string)
    secret_type         = optional(string)
    tags                = optional(map(string))
    ttl                 = optional(string)
    version_aliases     = optional(map(string))
    version_destroy_ttl = optional(string)
    customer_managed_encryption = optional(object({
      kms_key_name = string
    }))
    rotation = optional(object({
      next_rotation_time = optional(string)
      rotation_period    = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
    topics = optional(list(object({
      name = string
    })))
  }))
}

