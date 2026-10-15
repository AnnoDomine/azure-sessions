#!/usr/bin/env bash
# ==============================================================================
# 5. SOFTWARE-INSTALLATION VIA RUN-COMMAND (OHNE SSH/PUBLIC IP)
# ==============================================================================
# Führt ein Shell-Skript über den internen Azure VM Agent aus (kein offener SSH-Port nötig)
# Parameter:
#   --resource-group $RG                                            : Resource Group der Ziel-VM
#   --name webvm                                                    : Name der VM, auf der das Skript ausgeführt werden soll
#   --command-id RunShellScript                                     : Azure-interner Handler für Linux-Bash-Befehle
#   --scripts "sudo apt-get update && sudo apt-get install -y nginx" : Auszuführende Befehle (Aktualisierung & Nginx-Installation)

az vm run-command invoke \
  --resource-group $RG \
  --name webvm \
  --command-id RunShellScript \
  --scripts "sudo apt-get update && sudo apt-get install -y nginx"
