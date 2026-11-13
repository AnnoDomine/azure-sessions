# DevSecOps 1: DevOps – The Security Perspective

Themenschwerpunkte dieser Session sind die **DevSecOps- und Shift-Left-Architektur**, **Supply-Chain-Bedrohungen gegen Build-Pipelines** (Fallstudie **SolarWinds 2020**) sowie **Git-Workflows und Pull Requests** als technische Sicherheitsschleuse auf Ubuntu.

---

## Übersicht der Skripte

| Datei | Beschreibung |
| --- | --- |
| [`00_env_variables.sh`](./00_env_variables.sh) | Zentrale Variablen (`PROJECT_DIR`, `FEATURE_BRANCH`) |
| [`01_git_basics_demo.sh`](./01_git_basics_demo.sh) | Git-Initialisierung inkl. `.gitignore`-Schutz, Commit und Feature-Branching |

---

## Technische Insights & Konzepte

### 1. Warum Build-Pipelines das primäre Angriffsziel sind (SolarWinds 2020)
- **Angriffspfad**: Statt tausende Produktionssysteme einzeln anzugreifen, kompromittierte APT29 den Build-Server. Der Schadcode wurde während der Kompilierung injiziert und mit dem offiziellen Code-Signing-Zertifikat signiert (~18.000 betroffene Organisationen).
- **Konsequenz**: Build-Runner und Artefakt-Repositories benötigen mindestens dasselbe Sicherheitsniveau (Least Privilege, Ephemeral Runners, Signaturprüfung) wie Produktionsserver.

### 2. Shift-Left-Sicherheit im SDLC
- Sicherheitsprüfungen erst vor dem Release erzeugen einen Flaschenhals und exponentiell höhere Behebungskosten.
- **Technische Umsetzung pro Phase**:
  - **Plan**: Threat Modeling vor Implementierungsbeginn
  - **Code**: `.gitignore`, Pre-Commit-Hooks & Secret-Scanning (`gitleaks`)
  - **Build**: Dependency- & SBOM-Scans (`trivy`, `dependabot`)
  - **Test**: Automatisierte SAST/DAST-Gates in Pull Requests
  - **Deploy**: IaC-Scanning vor `terraform apply`
  - **Monitor**: Runtime-Detektion (`Falco`, `Tetragon`)

### 3. Git als Audit-Trail & Pull Requests als Policy-Gate
- Jeder Commit bildet einen kryptografisch verketteten Snapshot (Autor, Zeitstempel, Diff). Einmal gepushte Secrets bleiben in der Historie (`git log -p`), auch wenn sie in einem Folge-Commit gelöscht werden – daher sofort rotieren und per `git filter-repo` bereinigen.
- **Branch Protection + Pull Requests**: Verhindern direktes Pushen auf `main`, erzwingen Peer-Reviews (4-Augen-Prinzip) und blockieren das Mergen bei fehlgeschlagenen Security-Checks.
