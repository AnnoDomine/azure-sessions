# DevSecOps 9: Securing Infrastructure as Code (TerraGoat, Trivy & Azure State Backend)

Themenschwerpunkte dieser Session sind **IaC-Fehlkonfigurationen** (*Gültig ≠ Sicher*), automatisiertes **IaC-Scanning mit Trivy** anhand von **TerraGoat**, der Vergleich **KI-Tools vs. deterministische Scanner**, **Terraform-Supply-Chain-Risiken** sowie die konkrete Bereitstellung eines **gehärteten Remote State Backends auf Azure per `az` CLI**.

---

## Übersicht der Dateien

| Datei | Beschreibung |
| --- | --- |
| [`00_env_variables.sh`](./00_env_variables.sh) | Zentrale Variablen (`TF_STATE_RG`, `LOCATION`, `TF_STATE_STORAGE`, `TF_STATE_CONTAINER`) |
| [`01_clone_terragoat.sh`](./01_clone_terragoat.sh) | Klonen von `bridgecrewio/terragoat` und Wechsel nach `terragoat/terraform/azure` *(nicht deployen!)* |
| [`02_trivy_scan_iac.sh`](./02_trivy_scan_iac.sh) | Statischer IaC-Scan mittels `trivy config .` und `--severity HIGH,CRITICAL` |
| [`03_create_tfstate_backend_az.sh`](./03_create_tfstate_backend_az.sh) | Provisionierung eines gehärteten Azure Storage Accounts für `terraform.tfstate` via `az` CLI |

---

## Workflow & Erläuterungen

### 1. Gültig ≠ Sicher (`terraform validate` vs. Security-Scan)
- `terraform validate` prüft ausschließlich HCL-Syntax und Schema-Konsistenz. Eine Regel wie `azurerm_network_security_rule` mit `destination_port_range = "22"` und `source_address_prefix = "*"` ist syntaktisch zu 100 % valide, öffnet aber SSH weltweit.
- **Workflow-Gate**: `Terraform Code → trivy config → Remediation → terraform plan → terraform apply`.

### 2. Deterministische Scanner vs. KI-Analyse
- **Trivy (`trivy config`)**: Reproduzierbar, regelbasiert, Exit-Code-fähig (`--exit-code 1`) und damit als hartes CI/CD-Gate geeignet.
- **Kontext-Lücke**: Automatisierte Scanner kennen keinen Business-Kontext (z. B. ob `10.20.0.0/16` ein vertrauenswürdiges Admin-Bastion-Netz oder das gesamte Corporate-LAN ist). KI-Tools können beim Erklären und Refactoren unterstützen, ersetzen aber kein deterministisches Policy-Gate.

### 3. Supply-Chain-Risiko bei Terraform-Modulen
- Externe Module aus öffentlichen Registries führen bei `terraform init` / `plan` / `apply` fremde Provider- und Modul-Definitionen aus (z. B. **Coder-Registry-Vorfall 2026**).
- **Gegenmaßnahmen**: Modulversionen strikt pinnen (`version = "= x.y.z"`), `.terraform.lock.hcl` einchecken und nur verifizierte/interne Module verwenden.

### 4. Terraform State Security (`03_create_tfstate_backend_az.sh`)
- `terraform.tfstate` speichert Ressourcen-IDs, IPs, Connection Strings, Passwörter und Tokens **standardmäßig im Klartext**.
- **Absicherung auf Azure**:
  - Zentrales **Azure Storage Backend** mit `--allow-blob-public-access false`, `--min-tls-version TLS1_2` und Encryption at Rest.
  - **Blob Versioning** für Rollbacks und **Azure Blob Leases** für automatisches State-Locking bei Team-Zugriffen.
  - Zugriff ausschließlich über **Entra ID RBAC** (`--auth-mode login`) statt geteilter Storage Account Keys; `*.tfstate*` stets in `.gitignore` ausschließen.
