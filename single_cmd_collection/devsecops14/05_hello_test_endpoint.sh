#!/usr/bin/env bash
# ==============================================================================
# 5. HELLO WORLD: HTTP-TRIGGER TESTEN
# ==============================================================================
# Sendet einen HTTP-GET-Request mit Query-Parameter "name" an den
# bereitgestellten Azure Function Endpunkt (/api/hello).

curl "https://${FUNCAPP_HELLO}.azurewebsites.net/api/hello?name=Cybersteps"
