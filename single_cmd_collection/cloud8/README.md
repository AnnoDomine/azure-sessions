# Cloud 8: FinOps & Azure Cost Management

Themenschwerpunkte sind **FinOps & Cloud-Kostenoptimierung** mittels **Azure Advisor Cost Recommendations**, **VM-Lifecycle-Steuerung** (Identifikation laufender VMs, **Deallocation** und **Auto-Shutdown**), das Aufspüren **verwaister Managed Disks (`managedBy==null`)**, die Einrichtung von **Cost Management Budgets (`az consumption budget`)** sowie **Cost Allocation & Tag-Governance** über Ressourcen-Tags und die **Azure Policy `Require a tag on resources`**.

---

## Übersicht der Dateien

| Datei | Beschreibung |
| --- | --- |
| [`00_env_variables.sh`](./00_env_variables.sh) | Alle Basis-Umgebungsvariablen (`RG`, `REGION`, `SUB`, `VM`, `TAG_NAME`) gemeinsam |
| [`01_export_rg.sh`](./01_export_rg.sh) | `export RG="cloud8-lab-rg"` |
| [`02_export_region.sh`](./02_export_region.sh) | `export REGION="germanywestcentral"` |
| [`03_export_sub.sh`](./03_export_sub.sh) | Liest die aktive Subscription-ID aus und speichert sie in `SUB` |
| [`04_export_vm.sh`](./04_export_vm.sh) | `export VM="cloud8-vm"` |
| [`05_az_group_create.sh`](./05_az_group_create.sh) | Erstellt die Azure Resource Group `cloud8-lab-rg` |
| [`06_az_vm_create.sh`](./06_az_vm_create.sh) | Erstellt die Ubuntu-VM `cloud8-vm` (`Standard_D2s_v6`) |
| [`07_export_vm_id.sh`](./07_export_vm_id.sh) | Speichert die Resource-ID der VM `cloud8-vm` in `VM_ID` |
| [`08_az_advisor_recommendation_list_cost.sh`](./08_az_advisor_recommendation_list_cost.sh) | Aktualisiert und listet Azure Advisor Empfehlungen der Kategorie `Cost` tabellarisch auf |
| [`09_az_vm_list_running.sh`](./09_az_vm_list_running.sh) | Identifiziert alle aktuell laufenden VMs (`powerState=='VM running'`) |
| [`10_az_vm_deallocate.sh`](./10_az_vm_deallocate.sh) | Fährt die VM `cloud8-vm` herunter und gibt die Compute-Ressourcen frei (`deallocate`) |
| [`11_az_vm_auto_shutdown.sh`](./11_az_vm_auto_shutdown.sh) | Konfiguriert einen täglichen Auto-Shutdown für `cloud8-vm` um `21:00` Uhr |
| [`12_az_disk_list_unattached.sh`](./12_az_disk_list_unattached.sh) | Sucht nach nicht zugeordneten (verwaisten) Managed Disks (`managedBy==null`) |
| [`13_az_consumption_budget_create.sh`](./13_az_consumption_budget_create.sh) | Erstellt das monatliche Kostenbudget `cloud8-monthly` (Betrag: `100`) für die Resource Group |
| [`14_az_consumption_budget_show.sh`](./14_az_consumption_budget_show.sh) | Zeigt die Konfiguration und Details des Budgets `cloud8-monthly` tabellarisch an |
| [`15_export_rg_id.sh`](./15_export_rg_id.sh) | Speichert die Resource-ID der Resource Group in `RG_ID` |
| [`16_az_tag_create.sh`](./16_az_tag_create.sh) | Vergibt die Cost-Allocation-Tags `project=Banane` und `team=Klasse0426` auf die Resource Group |
| [`17_export_policy_id.sh`](./17_export_policy_id.sh) | Ermittelt die Policy-Definition-ID für `Require a tag on resources` und speichert sie in `POLICY_ID` |
| [`18_export_tag_name.sh`](./18_export_tag_name.sh) | `export TAG_NAME="owner"` |
| [`19_az_policy_assignment_create.sh`](./19_az_policy_assignment_create.sh) | Weist die Pflicht-Tag-Policy (`require-tag-owner`) auf die Resource Group zu |
| [`20_az_vm_create_tagged.sh`](./20_az_vm_create_tagged.sh) | Erstellt die Policy-konforme Test-VM `test-tag-vm-cloud8` inklusive Pflicht-Tag `owner=$SUB` |
| [`21_az_group_delete.sh`](./21_az_group_delete.sh) | Löscht die gesamte Resource Group zur Bereinigung |
