resource "google_secret_manager_regional_secret" "secret_manager_regional_secrets" {
  for_each = var.secret_manager_regional_secrets

  location            = each.value.location
  secret_id           = each.value.secret_id
  annotations         = each.value.annotations
  deletion_policy     = each.value.deletion_policy
  deletion_protection = each.value.deletion_protection
  expire_time         = each.value.expire_time
  labels              = each.value.labels
  project             = each.value.project
  secret_type         = each.value.secret_type
  tags                = each.value.tags
  ttl                 = each.value.ttl
  version_aliases     = each.value.version_aliases
  version_destroy_ttl = each.value.version_destroy_ttl

  dynamic "customer_managed_encryption" {
    for_each = each.value.customer_managed_encryption != null ? [each.value.customer_managed_encryption] : []
    content {
      kms_key_name = customer_managed_encryption.value.kms_key_name
    }
  }

  dynamic "rotation" {
    for_each = each.value.rotation != null ? [each.value.rotation] : []
    content {
      next_rotation_time = rotation.value.next_rotation_time
      rotation_period    = rotation.value.rotation_period
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "topics" {
    for_each = each.value.topics != null ? each.value.topics : []
    content {
      name = topics.value.name
    }
  }
}

