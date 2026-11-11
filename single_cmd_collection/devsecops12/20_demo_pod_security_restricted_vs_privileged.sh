#!/usr/bin/env bash
# ==============================================================================
# 20. STANDALONE-DEMO: RESTRICTED VS. PRIVILEGED PODS & CONTAINER ESCAPE
# ==============================================================================
# Demonstriert die Relevanz von Pod Security Standards:
# 1. restricted-pod: Standard-Container ohne privilegierte Flags. Schreibversuche
#    auf sensible Systemdateien werden mit "Permission denied" quittiert.
# 2. dangerous-pod: Container mit "privileged: true" und gemountetem Host-Root-
#    Dateisystem (hostPath: / -> /host).
#    Schreibt direkt auf das Betriebssystem des Kubernetes-Knotens.

echo "=== 1. Test in restricted-pod (Erwartet: Permission denied) ==="
kubectl exec restricted-pod -n default -- sh -c 'echo test > /etc/shadow' || echo "=> Schreibzugriff erfolgreich verhindert (Permission denied)"

echo -e "\n=== 2. Test in dangerous-pod (Schreibt auf den Host-Node) ==="
kubectl exec dangerous-pod -n default -- sh -c 'echo "Erfolgreicher Durchgriff auf den Host-Node" > /host/DEMO-PROOF.txt'

echo -e "\n=== 3. Überprüfung auf Host-Ebene via Minikube SSH ==="
minikube ssh -- cat /DEMO-PROOF.txt

echo -e "\n=== 4. Testdatei auf Host bereinigen ==="
minikube ssh -- rm -f /DEMO-PROOF.txt
