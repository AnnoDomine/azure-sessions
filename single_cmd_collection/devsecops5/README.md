# DevSecOps 5: Software Supply Chain Security (SBOM, Dependabot & Trivy)

Themenschwerpunkte dieser Session sind **Angriffsvektoren auf die Software-Lieferkette** (**XZ Utils**, **Shai-Hulud**), **transitive Abhängigkeiten**, die Generierung und Auswertung von **Software Bills of Materials (SBOM)** im CycloneDX-Format mittels **Trivy**, automatisierte Dependency-Updates (**Dependabot**) sowie **Typosquatting und AI-Slopsquatting**.

---

## Übersicht der Dateien

| Datei | Beschreibung |
| --- | --- |
| [`01_trivy_sbom_nodegoat.sh`](./01_trivy_sbom_nodegoat.sh) | Klonen von `OWASP/NodeGoat`, Erstellen einer CycloneDX-SBOM (`sbom.json`) und Schwachstellen-Scan via `trivy sbom` |

---

## Workflow & Erläuterungen

### 1. Lieferketten-Komponenten & reale Angriffsmuster
- **Build-Pipeline (Fabrik)**, **Paket-Registries / Netzwerke (Lieferwagen)** und **Artefakt-/Container-Registries (Lager)** bilden zusammen die Software-Lieferkette.
- **XZ Utils**: Zeigt das Risiko von **Maintainer-Kompromittierung / Social Engineering** in vertrauenswürdigen Upstream-Open-Source-Projekten – bösartiger Code gelangt direkt in offizielle Releases.
- **Shai-Hulud**: Zeigt **Credential-Harvesting via Paket-Installationsskripte** (`postinstall` in npm), wodurch kompromittierte Pakete auf Entwickler-Workstations oder CI-Runnern Tokens stehlen und sich selbst weiterverbreiten.

### 2. Transitive Abhängigkeiten & SBOM-Praxis (`CycloneDX`)
- Ein Projekt deklariert oft nur wenige direkte Pakete, zieht über diese aber hunderte **transitive Abhängigkeiten** nach.
- **Vorteil einer SBOM (`sbom.json`)**:
  - Einmalig beim Build erzeugt (`trivy fs --format cyclonedx --output sbom.json .`), dokumentiert sie sämtliche Komponenten inklusive Versionen und PURLs (*Package URLs*).
  - Wird Monate später eine neue Zero-Day-CVE bekannt (z. B. Log4Shell), lässt sich die archivierte SBOM sofort ohne erneuten Build gegen die neue Schwachstellen-Datenbank prüfen (`trivy sbom sbom.json`).
- **Dependabot per CLI prüfen**: Über `gh api /repos/<owner>/<repo>/dependabot/alerts` lassen sich offene Dependency-Alerts auch direkt im Terminal auslesen.

### 3. Härtungsmaßnahmen gegen Paket-Angriffe
- **Lockfiles & Hash-Pinning**: `package-lock.json` bzw. `pip install --require-hashes` verhindern schleichende Änderungen in transitiven Paketen.
- **Install-Skripte einschränken**: `npm ci --ignore-scripts` verhindert unkontrollierte Codeausführung während `npm install`.
- **Typosquatting & Slopsquatting**: Paketnamen vor der Installation verifizieren (z. B. `urllib3` statt `urlib3`), insbesondere bei von LLMs vorgeschlagenen Paketen.
