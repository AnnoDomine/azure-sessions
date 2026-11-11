#!/usr/bin/env bash
# ==============================================================================
# 12. CONTAINER ESCAPE & NODE-KOMPROMITTIERUNG NACHWEISEN
# ==============================================================================
# Der Exploit-Pod hat über den gemounteten Host-Pfad ("/host" -> "/") eine Datei
# direkt auf dem Dateisystem des Kubernetes-Nodes hinterlegt.
#
# Mittels "minikube ssh" lesen wir diese Datei direkt auf der Node-Ebene aus.
# Dies belegt den erfolgreichen Ausbruch aus der Container-Sandbox auf das
# Betriebssystem des Nodes (Escape via privileged + hostPath).
#
# Erwartete Ausgabe:
# "This file was written to the underlying NODE filesystem by a Pod created
#  using a stolen ServiceAccount token. Container escape via privileged + hostPath."

minikube ssh -- cat /PWNED-BY-LAB.txt
