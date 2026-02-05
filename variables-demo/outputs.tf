# =============================================================================
# VÄLJUNDID (Outputs)
# =============================================================================

# Lihtne output - ainult üks väärtus
output "config_file_path" {
  description = "Loodud config faili asukoht"
  # local_file.config viitab ressursile main.tf-st
  # .filename on selle ressursi atribuut
  value       = local_file.config.filename
}

output "greeting_file_path" {
  description = "Tervitusfaili asukoht"
  value       = local_file.greeting.filename
}

# Keerulisem output - mitu väärtust koos (object)
# See on mugav kui tahad kõik olulise info ühes kohas
output "summary" {
  description = "Deployment kokkuvõte"
  value = {
    app         = var.app_name                   # Sisendmuutuja väärtus
    environment = var.environment                # Sisendmuutuja väärtus
    port        = var.port                       # Sisendmuutuja väärtus
    config_path = local_file.config.filename     # Ressursi atribuut
  }
}