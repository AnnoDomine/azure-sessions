#!/usr/bin/env bash
# ==============================================================================
# 18. STANDALONE-DEMO: RBAC ALLOW / DENY EVALUIERUNG
# ==============================================================================
# Demonstriert die Funktionsweise von "kubectl auth can-i" und das gezielte
# Einschränken von Verben (list vs. get) mittels Role & RoleBinding im
# Namespace "demo".
#
# Schritt 1: Prüfung des Initialzustands (list pods -> yes)
# Schritt 2: Rollen-Härtung (role-deny.yaml entfernt "list")
# Schritt 3: Verifikation (list pods -> no, get pods -> yes)
# Schritt 4: Echter API-Aufruf als ServiceAccount führt zu "Forbidden"

echo "=== 1. Initialzustand: Darf demo-sa Pods auflisten? (Erwartet: yes) ==="
kubectl auth can-i list pods \
  --as=system:serviceaccount:demo:demo-sa \
  -n demo

echo -e "\n=== 2. Härtung: Rolle auf get-only einschränken ==="
kubectl apply -f manifests/02-rbac-can-i/role-deny.yaml

echo -e "\n=== 3. Berechtigungsprüfung nach Härtung ==="
echo "Darf demo-sa Pods auflisten? (Erwartet: no):"
kubectl auth can-i list pods \
  --as=system:serviceaccount:demo:demo-sa \
  -n demo

echo "Darf demo-sa einzelne Pods abrufen? (Erwartet: yes):"
kubectl auth can-i get pods \
  --as=system:serviceaccount:demo:demo-sa \
  -n demo

echo -e "\n=== 4. Echter API-Aufruf als demo-sa (Erwartet: Forbidden) ==="
kubectl get pods -n demo --as=system:serviceaccount:demo:demo-sa || true
