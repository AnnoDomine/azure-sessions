# Cloud 1: Cloud-Grundlagen & Erste Schritte mit der Azure CLI (`az`)

Themenschwerpunkte dieser Session sind die **Cloud-Architekturmodelle (CapEx vs. OpEx, Private/Public/Hybrid Cloud, IaaS/PaaS/SaaS)**, die **Azure-Ressourcenhierarchie** sowie der vollständige **CLI-Lifecycle** auf Ubuntu Linux – vom Anlegen einer Resource Group über ein gehärtetes Storage Account bis zur sauberen Deprovisionierung.

---

## Übersicht der Skripte

| Datei | Beschreibung |
| --- | --- |
| [`00_env_variables.sh`](./00_env_variables.sh) | Zentrale Variablen (`RG`, `LOCATION`, `STORAGE` mit `$RANDOM`-Suffix) |
| [`01_create_resource_group.sh`](./01_create_resource_group.sh) | Erstellen der Resource Group via `az group create` |
| [`02_create_storage_account.sh`](./02_create_storage_account.sh) | Bereitstellen eines Storage Accounts (`Standard_LRS`) |
| [`03_show_storage_account.sh`](./03_show_storage_account.sh) | Inspektion der Storage-Konfiguration (`az storage account show -o table`) |
| [`04_list_resources.sh`](./04_list_resources.sh) | Inventarisierung aller Ressourcen in der Resource Group (`az resource list`) |
| [`05_cleanup_resource_group.sh`](./05_cleanup_resource_group.sh) | Rückstandsfreies Löschen der Resource Group (`az group delete --yes --no-wait`) |

---

## Technische Insights & Konzepte

### 1. Ökonomie & Betriebsmodelle (CapEx vs. OpEx)
- **CapEx (Capital Expenditure)**: Vorabinvestition in physische Hardware, feste Kapazitätsplanung und Abschreibung.
- **OpEx (Operational Expenditure)**: Nutzungsabhängige Abrechnung (*Pay-as-you-go*), elastische Skalierung und Vermeidung von Überkapazitäten.
- **Cloud-Bereitstellungsmodelle**:
  - **Public Cloud**: Mandantenfähige, geteilte Infrastruktur (z. B. Microsoft Azure) mit maximaler Elastizität.
  - **Private Cloud**: Dedizierte Infrastruktur für maximale Kontrolle/Compliance bei höherem Eigenbetriebsaufwand.
  - **Hybrid Cloud**: Verknüpfung lokaler Rechenzentren mit Public-Cloud-Ressourcen (z. B. über VPN/ExpressRoute).

### 2. Service-Ebenen (Shared Responsibility)
- **IaaS**: Kontrolle über Betriebssystem, Patch-Management, Kernel-Hardening und Laufzeitumgebung (z. B. Azure VMs).
- **PaaS**: Verwaltete Laufzeitumgebung; Fokus liegt auf Anwendungscode, Konfiguration und Daten (z. B. Azure App Service).
- **SaaS**: Vollständig verwaltete Endnutzer-Anwendung; Fokus liegt auf Identitäten, Rollen und Datenklassifizierung.

### 3. Azure-Hierarchie, Regionen & CLI-Besonderheiten
- **Hierarchie**: Tenant (Entra ID) → Subscription (Abrechnungs- & Quota-Grenze, z. B. vCPU-Limits und Policy-Einschränkungen) → Resource Group (Lebenszyklus-Container) → Ressource.
- **Regionen & Availability Zones**: Physisch getrennte Rechenzentren innerhalb einer Region schützen vor lokalen Ausfällen; die Regionswahl beeinflusst **Latenz** und **Datensouveränität (DSGVO)**.
- **Globale Namensräume**: Ein Azure Storage Account erhält einen öffentlichen DNS-Namen (`<name>.blob.core.windows.net`). Daher muss `STORAGE` weltweit eindeutig sein (3–24 Zeichen, nur Kleinbuchstaben und Ziffern) – in Bash ideal über `$RANDOM` gelöst.
- **Kostenhygiene**: Ungenutzte Ressourcen verursachen weiterhin Speicher-/IP-Kosten. Durch `az group delete --yes --no-wait` werden sämtliche enthaltenen Ressourcen atomar und ohne Wartezeit im Terminal entfernt.
