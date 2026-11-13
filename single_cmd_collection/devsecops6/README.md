# DevSecOps 6: Containers & Docker (Ubuntu CLI & Architektur)

Themenschwerpunkte dieser Session sind die **Linux-Kernel-Grundlagen von Containern vs. VMs**, die **Docker-Architektur & Overlay-Layer**, **Dockerfile-Best-Practices**, **Persistenz (Volumes vs. Bind-Mounts)**, **Netzwerkisolation & Port-Mapping** sowie **Docker Compose** und sicheres **Secret-Handling**.

---

## Übersicht der Dateien

| Datei | Beschreibung |
| --- | --- |
| [`00_env_variables.sh`](./00_env_variables.sh) | Zentrale Variablen (`TUTORIAL_CONTAINER`, `TUTORIAL_IMAGE`, `NGINX_CONTAINER`, `NGINX_IMAGE`) |
| [`01_docker_getting_started.sh`](./01_docker_getting_started.sh) | Benannten Container im Detached-Modus starten (`docker run -d --name ... -p 80:80`) |
| [`02_docker_port_mapping_nginx.sh`](./02_docker_port_mapping_nginx.sh) | Port-Mapping-Beispiel (`8080:80`) mit `nginx` |
| [`03_docker_cleanup_container.sh`](./03_docker_cleanup_container.sh) | Container-ID dynamisch in `TARGET_CID` extrahieren und via `docker rm -f` bereinigen |
| [`Dockerfile.example`](./Dockerfile.example) | Beispiel-`Dockerfile` für eine Python-3.12-Anwendung inkl. Layer-Caching |

---

## Workflow & Erläuterungen

### 1. VMs vs. Container & Security-Implikation
- **VMs**: Hardware-Virtualisierung per Hypervisor; jeder Gast bringt einen eigenen OS-Kernel mit.
- **Container**: Prozesse auf dem **gemeinsamen Host-Linux-Kernel**, isoliert durch **Namespaces** (PID, NET, MNT, UTS, IPC, USER) und limitiert durch **cgroups** (CPU, RAM).
- **Container-Escape-Risiko**: Da der Kernel geteilt wird, ermöglichen Kernel-Exploits, `privileged: true` oder gemountete Docker-Sockets (`/var/run/docker.sock`) den Ausbruch auf den Host.

### 2. Image-Layer, Caching & Ephemeral State
- Jede `RUN`-, `COPY`- oder `ADD`-Anweisung erzeugt einen unveränderlichen, gecachten Layer; ein laufender Container legt darüber lediglich eine flüchtige **Copy-on-Write-(OverlayFS)-Schicht**.
- **Layer-Optimierung**: `COPY requirements.txt .` und `RUN pip install ...` stehen im [`Dockerfile.example`](./Dockerfile.example) *vor* `COPY . .`, damit Code-Änderungen den Paket-Installations-Layer nicht invalidieren.
- **Flüchtigkeit**: Pakete, die zur Laufzeit im Container installiert werden, verschwinden beim Löschen des Containers. Persistente Daten gehören in **Docker Volumes** (von Docker verwaltet) oder **Bind-Mounts** (Host-Pfad, primär für Entwicklung).

### 3. Netzwerk-Minimalismus & Docker Compose
- **Least Exposure**: Nur der benötigte Web-Endpunkt wird über `-p <host>:<container>` veröffentlicht. Datenbanken (PostgreSQL, Redis) erhalten **kein** Host-Port-Mapping und kommunizieren ausschließlich im internen Bridge-Netzwerk per **Compose Service Discovery** (DNS-Name = Servicename, z. B. `redis:8080`).
- **Secrets in Compose**: Niemals Klartext-Passwörter in `docker-compose.yml` committen; lokal via `.env`-Datei (`${DB_PASSWORD}`) referenzieren und `.env` in `.gitignore` aufnehmen.
