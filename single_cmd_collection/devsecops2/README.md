# DevSecOps 2: GitHub Actions & CI/CD (Workflows, Secrets & CLI)

Themenschwerpunkte dieser Session sind die **GitHub-Actions-Architektur (`.github/workflows/*.yml`)**, **Trigger, Jobs und isolierte Runner**, das **verschlüsselte Secret-Management** über YAML und die GitHub CLI (`gh`) sowie **Supply-Chain-Schutz durch Action Pinning**.

---

## Übersicht der Dateien & Skripte

| Datei | Beschreibung |
| --- | --- |
| [`00_env_variables.sh`](./00_env_variables.sh) | Zentrale Variablen (`SECRET_NAME`, `WORKFLOW_FILE`) |
| [`01_gh_secrets_and_workflow_cli.sh`](./01_gh_secrets_and_workflow_cli.sh) | Secret-Verwaltung (`gh secret set`), Workflow-Trigger und Log-Inspektion per `RUN_ID` |
| [`secrets_demo.yml`](./secrets_demo.yml) | Referenz-Workflow für `workflow_dispatch` und `${{ secrets.DEMO_KEY }}` |

---

## Technische Insights & Konzepte

### 1. Runner-Isolation & Sicherheitskontext
- Jeder Job läuft standardmäßig auf einer frischen, ephemeren VM (`ubuntu-latest`, `windows-latest`, `macos-latest`), Jobs laufen parallel und lassen sich über `needs:` verketten.
- **Wichtige Sicherheitsgrenze**: Ephemere Runner schützen *zwischen* verschiedenen Workflow-Läufen – **während** eines Laufs hat jedoch jeder Step Zugriff auf den Checkout-Code, alle übergebenen `secrets.*` und das `GITHUB_TOKEN`.

### 2. Secrets sicher verwalten & Fallstricke
- GitHub maskiert bekannte Secret-Werte in den Logs automatisch als `***`.
- **Bypass-Risiko**: Transformationen (z. B. `base64`-Kodierung oder zeichenweises Splitten eines Secrets) hebeln die Log-Maskierung aus – Secrets daher **niemals** in `echo` oder Debug-Ausgaben verwenden.
- **Cloud-Deployment ohne statische Keys**: Für Azure-Deployments aus GitHub Actions heraus bevorzugt **OpenID Connect (OIDC) / Federated Credentials** mit einer Entra-ID-App-Registrierung statt langlebiger `AZURE_CREDENTIALS`-JSON-Secrets einsetzen.

### 3. Action Pinning gegen Supply-Chain-Angriffe
- Ein Tag wie `actions/checkout@v4` ist **veränderlich (mutable)** – wird das Upstream-Repo kompromittiert, kann der Tag auf Schadcode umgebogen werden.
- **Härtung**: Produktive Actions immer auf den unveränderlichen **40-stelligen Commit-SHA** pinnen (z. B. `uses: actions/checkout@<commit-sha> # v4`) und `permissions:` im Workflow nach dem Least-Privilege-Prinzip einschränken.
