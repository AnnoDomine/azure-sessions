# Cloud 5: Load Balancing & Web Application Firewall (WAF)

Themenschwerpunkte sind Layer-4-Lastverteilung mit **Azure Standard Load Balancer**, automatisiertes Backend-Provisioning (`web1` & `web2`), Layer-7-Schutz mittels **Azure Application Gateway (`WAF_v2`)** auf Basis von **OWASP 3.2** sowie Netzwerkdiagnose über **Azure Network Watcher (`test-ip-flow`)**.

---

## Übersicht der Dateien

| Datei | Beschreibung |
| --- | --- |
| [`00_env_variables.sh`](./00_env_variables.sh) | Alle Basis-Umgebungsvariablen (`RG`, `REGION`, `VNET`, `LB`, `GW`, `WAF_POL` etc.) gemeinsam |
| [`01_export_rg.sh`](./01_export_rg.sh) | `export RG="cloud5-lab-rg"` |
| [`02_export_region.sh`](./02_export_region.sh) | `export REGION="germanywestcentral"` |
| [`03_export_vnet.sh`](./03_export_vnet.sh) | `export VNET="cloud6-vnet"` |
| [`04_export_lb_vars.sh`](./04_export_lb_vars.sh) | Setzt Variablen für den Load Balancer (`LOAD_BALANCER_IP_NAME`, `LB`) |
| [`05_export_appgw_vars.sh`](./05_export_appgw_vars.sh) | Setzt Variablen für Application Gateway & WAF (`GW`, `GW_SUB`, `GW_IP`, `WAF_POL`) |
| [`06_az_group_create.sh`](./06_az_group_create.sh) | Erstellt die Azure Resource Group |
| [`07_az_network_vnet_create.sh`](./07_az_network_vnet_create.sh) | Erstellt das VNet (`10.20.0.0/16`) und das Subnetz `backend` (`10.20.1.0/24`) |
| [`08_az_network_public_ip_create_lb.sh`](./08_az_network_public_ip_create_lb.sh) | Erstellt die Standard Public-IP (`lb-ip`) für den Load Balancer |
| [`09_az_network_lb_create.sh`](./09_az_network_lb_create.sh) | Erstellt den Standard Load Balancer (`myLB`) mit Frontend `fe` und Backend-Pool `pool` |
| [`10_az_network_lb_probe_create.sh`](./10_az_network_lb_probe_create.sh) | Erstellt die TCP Health Probe (`health`) auf Port 80 |
| [`11_az_network_lb_rule_create.sh`](./11_az_network_lb_rule_create.sh) | Erstellt die Load-Balancing-Regel (`http`) für TCP Port 80 |
| [`12_provision_web_vms_loop.sh`](./12_provision_web_vms_loop.sh) | Erstellt `web1` & `web2` in einer Schleife, konfiguriert Public IPs, installiert Nginx via Run-Command, registriert die NICs im Backend-Pool und öffnet Port 80 in den NSGs |
| [`13_az_network_lb_address_pool_show.sh`](./13_az_network_lb_address_pool_show.sh) | Überprüft die im Load-Balancer-Pool `pool` registrierten Backend-IP-Konfigurationen |
| [`14_az_vm_stop_web1.sh`](./14_az_vm_stop_web1.sh) | Stoppt die VM `web1` zum Testen des Load-Balancer-Failovers |
| [`15_az_vm_start_web1.sh`](./15_az_vm_start_web1.sh) | Startet die VM `web1` nach dem Failover-Test wieder |
| [`16_az_network_vnet_subnet_create_appgw.sh`](./16_az_network_vnet_subnet_create_appgw.sh) | Erstellt das dedizierte Subnetz `appgw-subnet` (`10.20.2.0/24`) für das Application Gateway |
| [`17_az_network_public_ip_create_appgw.sh`](./17_az_network_public_ip_create_appgw.sh) | Erstellt die Standard Public-IP (`appgw-ip`) für das Application Gateway |
| [`18_az_network_appgw_waf_policy_create.sh`](./18_az_network_appgw_waf_policy_create.sh) | Erstellt die WAF-Policy (`myWAFPolicy`) mit dem Regelwerk `OWASP` Version `3.2` |
| [`19_az_network_appgw_waf_policy_setting_update.sh`](./19_az_network_appgw_waf_policy_setting_update.sh) | Aktiviert die WAF-Policy (`Enabled`) und schaltet sie in den `Prevention`-Modus |
| [`20_export_web_private_ips.sh`](./20_export_web_private_ips.sh) | Liest die privaten IPs von `web1` und `web2` aus (`WEB1_IP`, `WEB2_IP`) |
| [`21_az_network_appgw_create.sh`](./21_az_network_appgw_create.sh) | Erstellt das Application Gateway (`WAF_v2`) mit den Backend-Servern `WEB1_IP` & `WEB2_IP` |
| [`22_az_network_watcher_test_ip_flow_http.sh`](./22_az_network_watcher_test_ip_flow_http.sh) | Prüft via Network Watcher (`test-ip-flow`), ob eingehender Traffic auf Port 80 (`web2`) erlaubt ist |
| [`23_az_network_watcher_test_ip_flow_ssh.sh`](./23_az_network_watcher_test_ip_flow_ssh.sh) | Prüft via Network Watcher (`test-ip-flow`), ob eingehender Traffic auf Port 22 (`web2`) erlaubt ist |
| [`24_az_group_delete.sh`](./24_az_group_delete.sh) | Löscht die gesamte Resource Group zur Bereinigung |
