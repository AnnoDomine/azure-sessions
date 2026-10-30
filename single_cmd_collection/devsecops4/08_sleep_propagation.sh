#!/usr/bin/env bash
# ==============================================================================
# 6. WARTEZEIT FÜR RBAC-PROPAGIERUNG
# ==============================================================================
# Wartet 10 Sekunden, damit die neu zugewiesene RBAC-Rolle in Microsoft Entra ID
# und auf der Key-Vault-Datenebene repliziert wird.
# Ohne diese Wartezeit kann ein sofortiger Schreibzugriff zu einem Fehler
# (HTTP 403 Forbidden / Caller is not authorized) führen.

echo "Warte 10 Sekunden auf RBAC-Propagierung..."
sleep 10
