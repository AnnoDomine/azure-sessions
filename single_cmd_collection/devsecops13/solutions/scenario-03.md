# Szenario 03 – SSRF in the Kubernetes World

- **Kategorie**: Netzwerk & SSRF
- **Einstieg**: `http://127.0.0.1:1232` (Pod `app=internal-proxy`)

## Kurzinfo & Risiko
Über eine **Server-Side Request Forgery (SSRF)** können HTTP-Anfragen aus dem Pod-Netzwerk heraus gestellt werden. So lassen sich Cloud-Metadaten (`169.254.169.254`) sowie interne, nicht exponierte Kubernetes-Services per Cluster-DNS ansprechen.

![Szenario 3 Übersicht](../images/scenario-3.png)

## Solution
1. Lokalen Dienst im selben Container testen: `GET http://127.0.0.1:5000`.
2. Internen Microservice `metadata-db` abfragen: `GET http://metadata-db`.
3. Den Secret-Endpunkt `http://metadata-db/latest/secrets/kubernetes-goat` aufrufen.
   ![Szenario 3 Zugriff auf metadata-db](../images/sc-3-4.png)
4. Den erhaltenen Base64-String dekodieren:
   ```bash
   echo -n "azhzLWdvYXQtY2E5MGVmODVkYjdhNWFlZjAxOThkMDJmYjBkZjljYWI=" | base64 -d
   ```

![Szenario 3 Base64-Dekodierung](../images/sc-3-5.png)

## Gegenmaßnahmen
- Ziel-URLs serverseitig über eine strikte Allowlist prüfen.
- Link-Local-Zugriffe (`169.254.169.254`) und interne Service-Kommunikation mittels `NetworkPolicy` einschränken; IMDSv2 erzwingen.

---
[← Vorheriges Szenario](./scenario-02.md) | [Solutions-Übersicht](./README.md) | [Nächstes Szenario →](./scenario-04.md)
