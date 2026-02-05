terraform {
  required_providers {
    # "local" on provider'i nimi, mida kasutame koodis
    local = {
      source  = "hashicorp/local"  # Kust Terraform selle laeb (Registry)
      version = "~> 2.4"           # ~> tähendab: 2.4, 2.5, 2.9 OK, aga 3.0 mitte
    }
  }
}

# =============================================================================
# RESSURSID - MIDA ME LOOME
# =============================================================================

resource "local_file" "greeting" {
  filename = "${path.module}/output/hello.txt"
  content  = "Tere, Terraform MUUDETUD!\nSee fail on loodud IaC-ga.\n"
}

# Teine fail - konfiguratsioonifail
resource "local_file" "config" {
  filename = "${path.module}/output/app.conf"
  content  = <<-EOT
    server {
      port = 8080
      host = "localhost"
    }
  EOT
}