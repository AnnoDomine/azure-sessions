# Cloud 4: Storage & Databases

Themenschwerpunkte sind Azure Blob Storage (Lifecycle, SAS, Access Tiers) und Azure Database for PostgreSQL Flexible Server.

---

## Übersicht der Dateien

| Datei | Beschreibung |
| --- | --- |
| [`00_env_variables.sh`](./00_env_variables.sh) | Alle Basis-Umgebungsvariablen (`RG`, `REGION`, `ACCT`) gemeinsam |
| [`01_export_rg.sh`](./01_export_rg.sh) | `export RG="cloud4-lab-rg"` |
| [`02_export_region.sh`](./02_export_region.sh) | `export REGION="germanywestcentral"` |
| [`03_export_acct.sh`](./03_export_acct.sh) | `export ACCT="cloud5lab$RANDOM"` |
| [`04_az_group_create.sh`](./04_az_group_create.sh) | Erstellt die Azure Resource Group |
| [`05_az_storage_account_create.sh`](./05_az_storage_account_create.sh) | Erstellt den Azure Storage Account (`Standard_LRS`) |
| [`06_export_storage_key.sh`](./06_export_storage_key.sh) | Fragt den Primärschlüssel des Storage Accounts ab (`export KEY=...`) |
| [`07_az_storage_container_create.sh`](./07_az_storage_container_create.sh) | Erstellt den privaten Blob-Container `private-data` |
| [`08_create_sample_file.sh`](./08_create_sample_file.sh) | Erstellt die lokale Testdatei `secret.txt` |
| [`09_az_storage_blob_upload.sh`](./09_az_storage_blob_upload.sh) | Lädt `secret.txt` in den Blob-Container hoch |
| [`10_az_storage_blob_download.sh`](./10_az_storage_blob_download.sh) | Lädt den Blob als `secret-downloaded.txt` herunter |
| [`11_az_storage_blob_upload_memo.sh`](./11_az_storage_blob_upload_memo.sh) | Lädt `secret.txt` unter dem Namen `memo.txt` hoch |
| [`12_az_storage_blob_delete_memo.sh`](./12_az_storage_blob_delete_memo.sh) | Löscht den Blob `memo.txt` aus dem Container |
| [`13_az_storage_blob_list.sh`](./13_az_storage_blob_list.sh) | Listet alle Blobs im Container auf |
| [`14_az_storage_blob_set_tier_cool.sh`](./14_az_storage_blob_set_tier_cool.sh) | Setzt den Access Tier von `secret.txt` auf `Cool` |
| [`15_az_storage_blob_show_tier.sh`](./15_az_storage_blob_show_tier.sh) | Fragt die aktuelle Speicherzugriffsebene des Blobs ab |
| [`16_az_storage_blob_set_tier_hot.sh`](./16_az_storage_blob_set_tier_hot.sh) | Setzt den Access Tier zurück auf `Hot` |
| [`17_export_sas_token.sh`](./17_export_sas_token.sh) | Generiert URL und SAS-Token mit 15 Min. Gültigkeit |
| [`18_curl_blob_sas.sh`](./18_curl_blob_sas.sh) | Testet den Download via HTTPS & SAS-Token mit `curl` |
| [`19_az_storage_account_allow_public_access.sh`](./19_az_storage_account_allow_public_access.sh) | Aktiviert öffentlichen Blob-Zugriff auf Account-Ebene |
| [`20_az_storage_container_set_public_access.sh`](./20_az_storage_container_set_public_access.sh) | Schaltet den Container auf `container` (anonym öffentlich) |
| [`21_az_storage_container_disable_public_access.sh`](./21_az_storage_container_disable_public_access.sh) | Schaltet den Container-Zugriff wieder auf `off` (privat) |
| [`22_az_storage_account_disable_public_access.sh`](./22_az_storage_account_disable_public_access.sh) | Deaktiviert öffentlichen Zugriff auf Account-Ebene |
| [`23_export_env_postgres.sh`](./23_export_env_postgres.sh) | Setzt DB-Variablen (`PG_NAME`, `PG_ADMIN`, `PG_PASS`) |
| [`24_az_postgres_flexible_server_create.sh`](./24_az_postgres_flexible_server_create.sh) | Erstellt den PostgreSQL Flexible Server (Version 16) |
| [`25_az_provider_register_postgres.sh`](./25_az_provider_register_postgres.sh) | Registriert `Microsoft.DBforPostgreSQL` (Fallback) |
| [`26_export_my_ip.sh`](./26_export_my_ip.sh) | Ermittelt die eigene Client-IP via `api.ipify.org` |
| [`27_az_postgres_firewall_rule_create.sh`](./27_az_postgres_firewall_rule_create.sh) | Richtet PostgreSQL Firewall-Regel für Client-IP ein |
| [`28_az_postgres_flexible_server_show.sh`](./28_az_postgres_flexible_server_show.sh) | Zeigt PostgreSQL Serverdetails (Status, FQDN) tabellarisch |
| [`29_export_pg_host_info.sh`](./29_export_pg_host_info.sh) | Ermittelt FQDN (`PG_HOST`) und gibt Verbindungsdaten aus |
| [`30_psql_test_version.sh`](./30_psql_test_version.sh) | Testet DB-Verbindung via `psql` (`SELECT version();`) |
| [`31_psql_table_roundtrip.sh`](./31_psql_table_roundtrip.sh) | Führt SQL-Roundtrip aus (`CREATE TABLE`, `INSERT`, `SELECT`) |
| [`32_az_group_delete.sh`](./32_az_group_delete.sh) | Löscht die gesamte Resource Group zur Bereinigung |
