# DevSecOps 13: Kubernetes Goat – Solutions (Szenarien 1–22)

Dieses Verzeichnis enthält die einzeln gegliederten **Lösungswege (Solutions)** für alle **22 Szenarien** des **Kubernetes Goat** Security Labs.

> [!NOTE]
> Zurück zur Session-Übersicht, den modularen Setup-Skripten (`00_env_variables.sh` – `07_teardown_kubernetes_goat.sh`) und dem Docker/`kubectl`-Cheat-Sheet: [`../README.md`](../README.md)

---

## Übersicht der Szenarien

| # | Szenario | Sicherheitsdomäne | Einstieg / Ziel | Solution |
| --- | --- | --- | --- | --- |
| 01 | Sensitive Keys in Codebases | Secrets & Supply Chain | `http://127.0.0.1:1230` (`app=build-code`) | [`scenario-01.md`](./scenario-01.md) |
| 02 | DIND (Docker-in-Docker) Exploitation | Container Escape & Runtime | `http://127.0.0.1:1231` (`app=health-check`) | [`scenario-02.md`](./scenario-02.md) |
| 03 | SSRF in the Kubernetes World | Netzwerk & SSRF | `http://127.0.0.1:1232` (`app=internal-proxy`) | [`scenario-03.md`](./scenario-03.md) |
| 04 | Container Escape to the Host System | Container Escape & Runtime | `http://127.0.0.1:1233` (`app=system-monitor`) | [`scenario-04.md`](./scenario-04.md) |
| 05 | Docker CIS Benchmarks Analysis | Auditing & Observability | DaemonSet `docker-bench-security` | [`scenario-05.md`](./scenario-05.md) |
| 06 | Kubernetes CIS Benchmarks Analysis | Auditing & Observability | Jobs `kube-bench-security` | [`scenario-06.md`](./scenario-06.md) |
| 07 | Attacking Private Container Registry | Secrets & Supply Chain | `http://127.0.0.1:1235` (`app=poor-registry`) | [`scenario-07.md`](./scenario-07.md) |
| 08 | NodePort Exposed Services | Netzwerk & SSRF | Node-IPs & Ports `30000`–`32767` | [`scenario-08.md`](./scenario-08.md) |
| 09 | Helm v2 Tiller *(Deprecated)* | RBAC & Admission Control | `tiller-deploy.kube-system:44134` | [`scenario-09.md`](./scenario-09.md) |
| 10 | Analyzing Crypto Miner Container | Secrets & Supply Chain | Job `batch-check-job` | [`scenario-10.md`](./scenario-10.md) |
| 11 | Kubernetes Namespaces Bypass | Netzwerk & SSRF | `cache-store-service.secure-middleware:6379` | [`scenario-11.md`](./scenario-11.md) |
| 12 | Gaining Environment Information | Secrets & Supply Chain | `http://127.0.0.1:1233` (`app=system-monitor`) | [`scenario-12.md`](./scenario-12.md) |
| 13 | DoS the Memory/CPU Resources | Verfügbarkeit & Ressourcen | `http://127.0.0.1:1236` (`big-monolith`) | [`scenario-13.md`](./scenario-13.md) |
| 14 | Hacker Container Preview | Container Escape & Runtime | `madhuakula/hacker-container` | [`scenario-14.md`](./scenario-14.md) |
| 15 | Hidden in Layers | Secrets & Supply Chain | Job `hidden-layers` | [`scenario-15.md`](./scenario-15.md) |
| 16 | RBAC Least Privileges Misconfiguration | RBAC & Admission Control | `http://127.0.0.1:1236` (ServiceAccount API) | [`scenario-16.md`](./scenario-16.md) |
| 17 | KubeAudit – Audit Kubernetes Clusters | Auditing & Observability | `kubeaudit all` | [`scenario-17.md`](./scenario-17.md) |
| 18 | Falco – Runtime Security Monitoring | Auditing & Observability | Helm Chart `falcosecurity/falco` | [`scenario-18.md`](./scenario-18.md) |
| 19 | Popeye – Kubernetes Cluster Sanitizer | Auditing & Observability | `popeye` | [`scenario-19.md`](./scenario-19.md) |
| 20 | Secure Network Boundaries (NSP) | Netzwerk & SSRF | `NetworkPolicy` `website-deny` | [`scenario-20.md`](./scenario-20.md) |
| 21 | Cilium Tetragon (eBPF Observability) | Auditing & Observability | Helm Chart `cilium/tetragon` & `tetra` | [`scenario-21.md`](./scenario-21.md) |
| 22 | Kyverno Policy Engine | RBAC & Admission Control | `ClusterPolicy` `deny-exec-in-vault-namespace` | [`scenario-22.md`](./scenario-22.md) |
