# Cloud 6: Identity & Access Management (IAM, RBAC & Managed Identity)

Themenschwerpunkte sind die Abfrage von **Microsoft Entra ID** Benutzer- und Subscription-Informationen, das Untersuchen von **RBAC Built-in Roles (`Reader`, `Contributor`)**, das Bereitstellen einer VM mit **System-Assigned Managed Identity (`--assign-identity`)** sowie die gezielte Vergabe von **Role Assignments (`az role assignment create`)** auf Resource-Group- und Ressourcen-Scope (VM).

---

## Übersicht der Dateien

| Datei | Beschreibung |
| --- | --- |
| [`00_env_variables.sh`](./00_env_variables.sh) | Alle Basis-Umgebungsvariablen (`RG`, `REGION`, `VM`) gemeinsam |
| [`01_export_rg.sh`](./01_export_rg.sh) | `export RG="cloud6-rbac-rg"` |
| [`02_export_region.sh`](./02_export_region.sh) | `export REGION="germanywestcentral"` |
| [`03_export_vm.sh`](./03_export_vm.sh) | `export VM="mi-vm"` |
| [`04_az_ad_signed_in_user_show.sh`](./04_az_ad_signed_in_user_show.sh) | Zeigt Anzeigename und Entra-ID Object-ID des aktuell angemeldeten Benutzers |
| [`05_export_sub_and_user_id.sh`](./05_export_sub_and_user_id.sh) | Speichert die `USER_OBJECT_ID` und die `SUB_ID` in Umgebungsvariablen |
| [`06_az_role_definition_list_reader.sh`](./06_az_role_definition_list_reader.sh) | Liest die Berechtigungen (`actions`) der Built-in Rolle `Reader` im JSON-Format aus |
| [`07_az_role_assignment_list_user.sh`](./07_az_role_assignment_list_user.sh) | Listet bestehende RBAC-Rollenzuweisungen des angemeldeten Benutzers auf |
| [`08_az_group_create.sh`](./08_az_group_create.sh) | Erstellt die Azure Resource Group `cloud6-rbac-rg` |
| [`09_az_vm_create_mi.sh`](./09_az_vm_create_mi.sh) | Erstellt die Ubuntu-VM `mi-vm` mit aktivierter System-Assigned Managed Identity (`--assign-identity`) |
| [`10_export_vm_principal_and_ip.sh`](./10_export_vm_principal_and_ip.sh) | Liest die `PRINCIPAL_ID` der Managed Identity sowie die öffentliche IP (`VM_IP`) der VM aus |
| [`11_az_role_assignment_create_reader_rg.sh`](./11_az_role_assignment_create_reader_rg.sh) | Vergibt `Reader`-Rechte auf den Scope der gesamten Resource Group (`$RG_SCOPE`) |
| [`12_az_role_assignment_create_contributor_vm.sh`](./12_az_role_assignment_create_contributor_vm.sh) | Vergibt `Contributor`-Rechte gezielt auf den Scope der einzelnen VM (`$VM_SCOPE`) |
| [`13_az_role_assignment_list_principal.sh`](./13_az_role_assignment_list_principal.sh) | Überprüft alle zugewiesenen RBAC-Rollen für `$PRINCIPAL_ID` über alle Scopes (`--all`) |
| [`14_az_group_delete.sh`](./14_az_group_delete.sh) | Löscht die gesamte Resource Group zur Bereinigung |

---

## Workflow & Erläuterungen

### 1. AuthN (Entra ID) vs. AuthZ (Azure RBAC)
- **Authentication (AuthN – „Wer bist du?“)**: Identitätsprüfung über **Microsoft Entra ID** (Passwort, MFA, FIDO2/Biometrie). Entra ID besitzt zudem eigene Verzeichnisrollen (z. B. `Global Administrator` auf Tenant-Ebene), die strikt von Azure-Ressourcenrollen getrennt sind.
- **Authorization (AuthZ – „Was darfst du?“)**: Berechtigungsprüfung auf Azure-Ressourcen über **Azure RBAC**.

### 2. Anatomie eines Role Assignments & Vererbung
- Jedes Azure RBAC Role Assignment besteht aus drei Komponenten: **Security Principal** (*Wer*) + **Role Definition** (*Was*) + **Scope** (*Wo*).
- **Scope-Hierarchie**: `Management Group → Subscription → Resource Group → Ressource`. Berechtigungen vererben sich nach unten an alle untergeordneten Ressourcen.
- **Built-in Kernrollen**:
  - `Owner`: Vollzugriff inklusive Vergabe von Berechtigungen (höchstes Risiko).
  - `Contributor`: Vollzugriff auf Ressourcen, darf jedoch **keine** Berechtigungen/Access verwalten.
  - `Reader`: Reiner Lesezugriff ohne Schreib- oder Löschrechte.

### 3. Managed Identities & Principle of Least Privilege (PoLP)
- Mit `--assign-identity` erhält die VM `mi-vm` eine **System-Assigned Managed Identity** (gekoppelt an den Lebenszyklus der VM), deren `principalId` per `--query` ausgelesen wird.
- Anstatt statische Zugangsdaten im Code zu hinterlegen, erhält diese Identität `Reader`-Rechte auf die Resource Group und `Contributor`-Rechte ausschließlich auf die einzelne VM (*kleinster möglicher Scope*).
- **Side-Note**: Neu zugewiesene RBAC-Berechtigungen können aufgrund der Replikation ca. **1–2 Minuten** benötigen, bis sie wirksam werden.
