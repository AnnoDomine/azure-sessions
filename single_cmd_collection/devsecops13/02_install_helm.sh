#!/usr/bin/env bash
# ==============================================================================
# 2. HELM V3 INSTALLATION (MIT GPG-FINGERPRINT-VERIFIKATION)
# ==============================================================================
# Installiert Helm über das offizielle Buildkite-APT-Repository für Debian/Ubuntu.
# Der heruntergeladene GPG-Schlüssel wird vor der Installation gegen den
# erwarteten Fingerprint (HELM_BUILDKITE_APT_KEY_ID) geprüft, um eine
# Repository-Kompromittierung auszuschließen.

HELM_BUILDKITE_APT_KEY_ID="${HELM_BUILDKITE_APT_KEY_ID:-DDF78C3E6EBB2D2CC223C95C62BA89D07698DBC6}"

# Benötigte Pakete für den Download und die Signaturprüfung installieren
sudo apt-get install curl gpg --yes

# Öffentlichen GPG-Schlüssel herunterladen
curl -fsSL https://packages.buildkite.com/helm-linux/helm-debian/gpgkey > "${TMPDIR:-/tmp}/helm.asc"

# Schlüssel-Fingerprint prüfen, um manipulierte Keys zu verhindern
if [ "$(gpg --import --import-options=show-only --with-colons "${TMPDIR:-/tmp}/helm.asc" | awk -F: '$1 == "fpr" {print $10}' | head -n 1)" != "${HELM_BUILDKITE_APT_KEY_ID}" ]; then
    echo "ERROR: Unexpected Helm APT key ID: potential key compromise"
    exit 1
fi

# Ältere Helm-APT-Konfigurationen entfernen
sudo rm -f /etc/apt/sources.list.d/helm-stable-debian.list /usr/share/keyrings/helm.gpg

# Verifizierten GPG-Schlüssel installieren
sudo install -m 0644 -Dt /etc/apt/keyrings/ "${TMPDIR:-/tmp}/helm.asc"

# APT-Quelle im DEB822-Format hinterlegen
sudo tee /etc/apt/sources.list.d/helm-stable-debian.sources > /dev/null <<EOF
Types: deb
URIs: https://packages.buildkite.com/helm-linux/helm-debian/any/
Suites: any
Components: main
Signed-By: /etc/apt/keyrings/helm.asc
EOF

# Paketindex aktualisieren und Helm installieren
sudo apt-get update
sudo apt-get install helm
