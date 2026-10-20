# Cloud 7: Governance & Monitoring

Themenschwerpunkte sind **Azure Governance** mittels **Resource Locks (`CanNotDelete`)**, **Azure Policy (`Allowed locations`)** und **Ressourcen-Tags (`CostCenter`)** sowie **Monitoring & Observability** über **Azure Monitor (Metriken, Action Groups, Metric Alerts, Activity Log)**, **Azure Resource Health (via REST API)** und **Azure Advisor**.

---

## Übersicht der Dateien

| Datei | Beschreibung |
| --- | --- |
| [`00_env_variables.sh`](./00_env_variables.sh) | Alle Basis-Umgebungsvariablen (`RG`, `REGION`, `EMAIL`) gemeinsam |
| [`01_export_rg.sh`](./01_export_rg.sh) | `export RG="cloud7-gov-rg"` |
| [`02_export_region.sh`](./02_export_region.sh) | `export REGION="germanywestcentral"` |
| [`03_az_group_create.sh`](./03_az_group_create.sh) | Erstellt die Azure Resource Group `cloud7-gov-rg` |
| [`04_export_rg_id.sh`](./04_export_rg_id.sh) | Speichert die Resource-ID der Resource Group in `RG_ID` |
| [`05_az_lock_create.sh`](./05_az_lock_create.sh) | Erstellt einen `CanNotDelete` Resource Lock (`no-delete`) auf der Resource Group |
| [`06_az_group_delete_test_lock.sh`](./06_az_group_delete_test_lock.sh) | Testet den Löschschutz des Locks durch einen bewussten Löschversuch der Resource Group |
| [`07_export_policy_id.sh`](./07_export_policy_id.sh) | Ermittelt die Policy-Definition-ID für `Allowed locations` und speichert sie in `POLICY_ID` |
| [`08_az_policy_assignment_create.sh`](./08_az_policy_assignment_create.sh) | Weist die Policy `Allowed locations` (`germanywestcentral`) auf dem Scope der Resource Group zu |
| [`09_az_storage_account_create_deny_test.sh`](./09_az_storage_account_create_deny_test.sh) | Testet die Policy durch Bereitstellungsversuch eines Storage Accounts in `westus` (Deny) |
| [`10_az_vm_create.sh`](./10_az_vm_create.sh) | Erstellt die Ubuntu-VM `cloud7-vm` (`Standard_D2s_v6`) in der erlaubten Region |
| [`11_export_vm_id.sh`](./11_export_vm_id.sh) | Speichert die Resource-ID der VM `cloud7-vm` in `VM_ID` |
| [`12_az_monitor_metrics_list.sh`](./12_az_monitor_metrics_list.sh) | Fragt die VM-Metrik `Percentage CPU` im 1-Minuten-Intervall (`PT1M`) tabellarisch ab |
| [`13_export_email.sh`](./13_export_email.sh) | `export EMAIL="placeholder@example.com"` |
| [`14_az_monitor_action_group_create.sh`](./14_az_monitor_action_group_create.sh) | Erstellt die Action Group `cloud7-ag` mit E-Mail-Benachrichtigung an `$EMAIL` |
| [`15_export_ag_id.sh`](./15_export_ag_id.sh) | Speichert die Resource-ID der Action Group in `AG_ID` |
| [`16_az_monitor_metrics_alert_create.sh`](./16_az_monitor_metrics_alert_create.sh) | Erstellt die Metrik-Warnregel `high-cpu` (`avg Percentage CPU > 80` über 5 Min.) |
| [`17_az_tag_create.sh`](./17_az_tag_create.sh) | Vergibt das Tag `CostCenter=000` auf die Resource Group (`$RG_ID`) |
| [`18_az_monitor_activity_log_list.sh`](./18_az_monitor_activity_log_list.sh) | Listet die Activity-Log-Ereignisse der letzten 30 Minuten für die Resource Group auf |
| [`19_az_rest_resource_health.sh`](./19_az_rest_resource_health.sh) | Fragt den aktuellen `Microsoft.ResourceHealth` Availability-Status der VM per REST-API ab |
| [`20_az_advisor_recommendation_list.sh`](./20_az_advisor_recommendation_list.sh) | Listet aktuelle Empfehlungen von Azure Advisor nach Kategorie und Problem auf |
| [`21_az_lock_delete.sh`](./21_az_lock_delete.sh) | Entfernt den Resource Lock `no-delete` vor der Bereinigung |
| [`22_az_group_delete.sh`](./22_az_group_delete.sh) | Löscht die gesamte Resource Group zur Bereinigung |
