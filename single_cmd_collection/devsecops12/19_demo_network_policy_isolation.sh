#!/usr/bin/env bash
# ==============================================================================
# 19. STANDALONE-DEMO: MANDANTEN-ISOLATION MIT NETWORKPOLICIES
# ==============================================================================
# Demonstriert die Durchsetzung von Zero-Trust im Kubernetes-Netzwerk:
# 1. Standardmäßig ist das Kubernetes-Netzwerk flach (Tenant 1 erreicht Tenant 2).
# 2. Anwendung einer Default-Deny-Policy blockiert jeglichen unautorisierten Datenverkehr.
# 3. Gezielte Allow-Policy schaltet nur explizit erlaubte Routen frei.
#
# Voraussetzung: Ein CNI-Treiber mit NetworkPolicy-Unterstützung (wie Calico).

POD1=$(kubectl -n tenant-1 get pod -l app=nginx -o jsonpath='{.items[0].metadata.name}')

echo "=== 1. Flaches Netzwerk: Tenant-1 greift auf Tenant-2 zu (Erwartet: HTTP 200) ==="
kubectl -n tenant-1 exec "$POD1" -- wget -qO- http://nginx.tenant-2.svc.cluster.local:8080

echo -e "\n=== 2. Default-Deny Policy anwenden ==="
kubectl apply -f manifests/04-network-policy/np-default-deny.yaml

echo "Test nach Default-Deny (Erwartet: Timeout):"
kubectl -n tenant-1 exec "$POD1" -- wget -qO- -T 5 http://nginx.tenant-2.svc.cluster.local:8080 || echo "=> Verbindung wie erwartet blockiert (Timeout)"

echo -e "\n=== 3. Gezielte Freigabe für Tenant-1 anwenden ==="
kubectl apply -f manifests/04-network-policy/np-allow-from-tenant1.yaml

echo "Test nach Scoped-Allow (Erwartet: Erfolg):"
kubectl -n tenant-1 exec "$POD1" -- wget -qO- -T 5 http://nginx.tenant-2.svc.cluster.local:8080

echo -e "\n=== 4. Verifikation von Dritt-Namespaces (Default-Namespace bleibt geblockt) ==="
kubectl run prober --image=busybox:1.36 -n default -- sleep 3600 --restart=Never --dry-run=client -o yaml | kubectl apply -f -
kubectl wait --for=condition=Ready pod/prober -n default --timeout=30s
kubectl -n default exec prober -- wget -qO- -T 5 http://nginx.tenant-2.svc.cluster.local:8080 || echo "=> Dritt-Namespace wie erwartet isoliert (Timeout)"
kubectl delete pod prober -n default
