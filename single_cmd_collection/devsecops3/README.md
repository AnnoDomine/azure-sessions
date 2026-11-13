# DevSecOps 3: Code Scanning & Security Tools in CI (Gitleaks & Trivy)

Themenschwerpunkte dieser Session sind automatisiertes **Code-Scanning in CI/CD**, die Abgrenzung **SAST vs. DAST**, **Secret-Detection mit Gitleaks** über die gesamte Git-Historie sowie **Schwachstellen- und Fehlkonfigurations-Scans mit Trivy** inklusive **SARIF-Integration** in GitHub Security.

---

## Übersicht der Dateien

| Datei | Beschreibung |
| --- | --- |
| [`01_local_gitleaks_and_trivy_scan.sh`](./01_local_gitleaks_and_trivy_scan.sh) | Lokaler Pre-Push-Scan mit `gitleaks detect` und `trivy fs` auf Ubuntu |
| [`gitleaks.yml`](./gitleaks.yml) | GitHub-Actions-Workflow für Secret-Scanning inkl. voller Git-Historie (`fetch-depth: 0`) |
| [`trivy.yml`](./trivy.yml) | GitHub-Actions-Workflow für Trivy-Scan (`table` + `sarif`) und Upload via `upload-sarif@v4` |

---

## Workflow & Erläuterungen

### 1. SAST vs. DAST in der Pipeline
- **SAST (Static Application Security Testing)**: Prüft Quellcode, Abhängigkeiten und Konfigurationsdateien ohne Ausführung (schnell, ideal für jeden Commit/PR).
- **DAST (Dynamic Application Security Testing)**: Greift die laufende Anwendung von außen an (erkennt Laufzeit-, Auth- und Header-Probleme, läuft typischerweise in Staging).

### 2. Gitleaks & `fetch-depth: 0`
- `actions/checkout` lädt standardmäßig nur einen Shallow Clone (`fetch-depth: 1`). Ohne `fetch-depth: 0` übersieht Gitleaks Secrets, die in früheren Commits lagen.
- Erkennt Secrets über **Regex-Signaturen** und **Shannon-Entropie** (Zufälligkeitsmaß für API-Keys/Tokens).

### 3. Trivy, SARIF & CI-Gates (`trivy.yml`)
- **SARIF (Static Analysis Results Interchange Format)**: Standardisiertes JSON-Format zur zentralen Darstellung von Security-Befunden im GitHub-Tab `Security → Code scanning alerts`.
- **Zweistufiges Pattern**:
  1. `format: 'table'` + `exit-code: '0'` sorgt dafür, dass der Build-Log alle Befunde lesbar ausgibt und der nächste Schritt sicher ausgeführt wird.
  2. `format: 'sarif'` + `exit-code: '1'` erzeugt `trivy-results.sarif` und lässt das CI-Gate bei `HIGH`/`CRITICAL`-Funden fehlschlagen.
  3. `if: always()` beim `upload-sarif@v4`-Step stellt sicher, dass der Report auch bei fehlgeschlagenem Gate hochgeladen wird (`permissions: security-events: write` erforderlich).
