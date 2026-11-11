#!/usr/bin/env bash
# ==============================================================================
# 0. UMGEBUNGSVARIABLEN (ENVIRONMENT VARIABLES)
# ==============================================================================
# Alle Basis-Umgebungsvariablen für DevSecOps 12 (Kubernetes Security Lab):
# Beinhaltet Zieladressen, Namespaces, ServiceAccounts und Ressourcennamen.

# Zielanwendung & Port-Forwarding
export APP_HOST="http://localhost:5000"
export APP_SVC="cluster-health-dashboard"
export APP_PORT="5000"

# Namespaces
export DEFAULT_NS="default"
export VICTIM_NS="database"
export DEMO_NS="demo"
export TENANT1_NS="tenant-1"
export TENANT2_NS="tenant-2"

# Service Accounts
export APP_SA="system:serviceaccount:default:app-sa"
export DEMO_SA="system:serviceaccount:demo:demo-sa"

# Exploit-Artefakte & Pods
export EXPLOIT_POD="pwned-via-rbac"
export PROOF_FILE="/PWNED-BY-LAB.txt"
