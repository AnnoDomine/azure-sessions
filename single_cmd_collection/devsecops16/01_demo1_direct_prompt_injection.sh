#!/usr/bin/env bash
# ==============================================================================
# 1. DEMO 1: DIRECT PROMPT INJECTION (ATTEMPT A & ATTEMPT B)
# ==============================================================================
# Demonstriert zwei unterschiedliche Direct-Prompt-Injection-Techniken gegen
# ein reales Azure-AI-Deployment und zeigt zwei unabhängige Abwehrschichten:
#
# - Attempt A (`./01-demo1-attempt-a.sh`):
#   Naiver Instruction-Override. Wird bereits auf Plattform-Ebene vom
#   standardmäßig aktiven Azure-Jailbreak-Filter abgefangen
#   ("code": "content_filter", "jailbreak": {"detected": true, "filtered": true}),
#   bevor die Anfrage das Modell überhaupt erreicht.
#
# - Attempt B (`./02-demo1-attempt-b.sh`):
#   Role-Play-/Persona-Bypass. Passiert den Plattform-Filter ohne Fehler,
#   wird jedoch vom Modell selbst (Model Alignment / Safety Training) unter
#   Verweis auf die Vertraulichkeitsrichtlinie im Klartext abgelehnt.

# Attempt A: Naiver Override (Plattform-Filter greift)
./01-demo1-attempt-a.sh

# Attempt B: Role-Play / Persona-Bypass (Modell-Alignment greift)
./02-demo1-attempt-b.sh
