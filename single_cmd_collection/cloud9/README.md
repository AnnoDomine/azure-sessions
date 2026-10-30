# Cloud 9: Security Assessment & Compliance mit Prowler

Themenschwerpunkte sind **Cloud Security Posture Management (CSPM)** und **Compliance Auditing** für Microsoft Azure unter Einsatz von **Prowler**. Dazu gehören das Aufsetzen einer isolierten **Python Virtual Environment (`venv`)**, die Installation und Versionsprüfung von **Prowler**, die Authentifizierung über die **Azure CLI (`az login`)**, die Auswahl der Ziel-Subscription sowie die Durchführung automatisierter Security-Scans (u. a. nach CIS Microsoft Azure Foundations Benchmark) mit Multiformat-Exporten (**HTML**, **CSV**, **JSON-OCSF**) und deren Bereitstellung über einen lokalen Webserver.

---

## Übersicht der Dateien

| Datei | Beschreibung |
| --- | --- |
| [`00_env_variables.sh`](./00_env_variables.sh) | Liest die aktive Subscription-ID aus und speichert sie in `SUBSCRIPTION_ID` |
| [`01_python_venv_create.sh`](./01_python_venv_create.sh) | Erstellt die isolierte virtuelle Python-3-Umgebung `prowler-env` (`python3 -m venv prowler-env`) |
| [`02_python_venv_activate.sh`](./02_python_venv_activate.sh) | Aktiviert die virtuelle Umgebung (`source prowler-env/bin/activate`) |
| [`03_pip_upgrade.sh`](./03_pip_upgrade.sh) | Aktualisiert den Paketmanager `pip` innerhalb der virtuellen Umgebung (`pip install --upgrade pip`) |
| [`04_pip_install_prowler.sh`](./04_pip_install_prowler.sh) | Installiert das Cloud-Security-Auditing-Tool `prowler` |
| [`05_prowler_version.sh`](./05_prowler_version.sh) | Überprüft die installierte Prowler-Version (`prowler -v`) |
| [`06_az_login.sh`](./06_az_login.sh) | Führt den interaktiven Azure CLI Login durch (`az login`) |
| [`07_az_account_list.sh`](./07_az_account_list.sh) | Listet alle verfügbaren Azure Subscriptions tabellarisch auf (`az account list --output table`) |
| [`08_export_subscription_id.sh`](./08_export_subscription_id.sh) | Extrahiert die aktive Subscription-ID in die Variable `SUBSCRIPTION_ID` |
| [`09_az_account_set.sh`](./09_az_account_set.sh) | Setzt den Kontext der Azure CLI explizit auf die Ziel-Subscription (`az account set --subscription`) |
| [`10_prowler_azure_scan_default.sh`](./10_prowler_azure_scan_default.sh) | Startet das Standard-Prowler-Audit für Azure via CLI-Authentifizierung (`prowler azure --az-cli-auth`) |
| [`11_prowler_azure_scan_reports.sh`](./11_prowler_azure_scan_reports.sh) | Führt den gezielten Azure-Scan mit Report-Exporten (`html`, `csv`, `json-ocsf`) für `$SUBSCRIPTION_ID` aus |
| [`12_view_reports.sh`](./12_view_reports.sh) | Wechselt in das Verzeichnis `output` und listet generierte Berichtsdateien auf (`cd output && ls -la`) |
| [`13_start_report_server.sh`](./13_start_report_server.sh) | Startet einen lokalen Python-HTTP-Webserver auf Port 8000 zur Ansicht des HTML-Dashboards |

---

## Workflow & Erläuterungen

### 1. Vorbereitung der Python-Umgebung

Prowler wird als Python-Paket ausgeliefert. Um Konflikte mit systemweiten Python-Paketen zu vermeiden, wird eine dedizierte Virtual Environment namens `prowler-env` angelegt und aktiviert:

```bash
python3 -m venv prowler-env
source prowler-env/bin/activate
pip install --upgrade pip
pip install prowler
prowler -v
```

### 2. Azure-Authentifizierung & Subscription-Auswahl

Prowler unterstützt die direkte Wiederverwendung existierender Azure-CLI-Sitzungen (`--az-cli-auth`). Damit entfällt die Notwendigkeit, separate Service Principals oder Secrets im Skript zu hinterlegen:

```bash
az login
az account list --output table
export SUBSCRIPTION_ID="$(az account show --query id -o tsv)"
az account set --subscription "$SUBSCRIPTION_ID"
```

### 3. Sicherheitsaudit mit Prowler ausführen

Der Scan analysiert die Konfigurationen sämtlicher Azure-Services (z. B. Entra ID, Storage Accounts, NSGs, Virtual Machines, Key Vaults, SQL Databases) anhand etablierter Industriestandards (wie CIS Azure Foundations Benchmark):

```bash
prowler azure \
  --az-cli-auth \
  -M html csv json-ocsf \
  --subscription-ids "$SUBSCRIPTION_ID"
```

**Erklärungen der Parameter**:

- `azure`: Provider-Ziel für Microsoft Azure.
- `--az-cli-auth`: Verwendet das aktive Token aus `az login`.
- `-M html csv json-ocsf`: Erzeugt drei komplementäre Berichtsformate:
  - `html`: Grafisch aufbereitetes, interaktives Dashboard mit Filtermöglichkeiten nach Schweregrad (Critical, High, Medium, Low) und Compliance-Frameworks.
  - `csv`: Strukturierte Tabellendaten für weitere Auswertungen oder Importe.
  - `json-ocsf`: Standardisiertes Security-Format basierend auf dem Open Cybersecurity Schema Framework (OCSF) zur einfachen Weiterverarbeitung in SIEM-Systemen.
- `--subscription-ids`: Beschränkt die Überprüfung gezielt auf die gewünschte Azure-Subscription.

### 4. Berichte sichten & Webserver starten

Die erzeugten Berichte werden im Unterordner `output/` gespeichert. Zur bequemen Betrachtung des HTML-Dashboards kann direkt ein minimalistischer Python-Webserver gestartet werden:

```bash
cd output
python3 -m http.server 8000
```

Anschließend kann das Dashboard im Browser unter `http://localhost:8000` aufgerufen werden.
