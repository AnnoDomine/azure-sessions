#!/usr/bin/env bash
# ==============================================================================
# INIT.SH – SYSTEM- & TOOL-CHECK / INSTALLATION FÜR UBUNTU / DEBIAN
# ==============================================================================
# Prüft alle für die Sessions (Cloud 1–9 & DevSecOps 1–13) benötigten CLI-Tools
# und installiert fehlende Binaries automatisch über offizielle Paketquellen
# bzw. verifizierte Releases.
#
# Verwendung:
#   chmod +x init.sh
#   ./init.sh

set -euo pipefail

# Farben für Statusausgaben
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
BLUE="\033[0;34m"
NC="\033[0m"

log_info()    { echo -e "${BLUE}[INFO]${NC} $*"; }
log_ok()      { echo -e "${GREEN}[OK]${NC}   $*"; }
log_install() { echo -e "${YELLOW}[INST]${NC} $*"; }

has_cmd() {
    command -v "$1" >/dev/null 2>&1
}

ARCH="$(dpkg --print-architecture)"
case "$ARCH" in
    amd64) BIN_ARCH="amd64"; GH_ARCH="x64" ;;
    arm64) BIN_ARCH="arm64"; GH_ARCH="arm64" ;;
    *)
        echo "Nicht unterstützte Architektur: $ARCH"
        exit 1
        ;;
esac

log_info "Starte Tool-Prüfung für Architektur: $ARCH"

# ------------------------------------------------------------------------------
# 1. Basis-Pakete (apt)
# ------------------------------------------------------------------------------
BASE_PKGS=(curl wget gpg git jq unzip ca-certificates lsb-release apt-transport-https python3 python3-venv python3-pip)
MISSING_BASE=()

for pkg in "${BASE_PKGS[@]}"; do
    if ! dpkg -s "$pkg" >/dev/null 2>&1; then
        MISSING_BASE+=("$pkg")
    fi
done

if [ "${#MISSING_BASE[@]}" -gt 0 ]; then
    log_install "Installiere fehlende Basis-Pakete: ${MISSING_BASE[*]}"
    sudo apt-get update
    sudo apt-get install -y "${MISSING_BASE[@]}"
else
    log_ok "Alle Basis-Pakete sind installiert."
fi

sudo mkdir -p /etc/apt/keyrings

# ------------------------------------------------------------------------------
# 2. Azure CLI (az)
# ------------------------------------------------------------------------------
if has_cmd az; then
    log_ok "Azure CLI (az) bereits installiert: $(az version --query '"azure-cli"' -o tsv 2>/dev/null || echo 'vorhanden')"
else
    log_install "Installiere Azure CLI (az)..."
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
fi

# ------------------------------------------------------------------------------
# 3. GitHub CLI (gh)
# ------------------------------------------------------------------------------
if has_cmd gh; then
    log_ok "GitHub CLI (gh) bereits installiert: $(gh --version | head -n 1)"
else
    log_install "Installiere GitHub CLI (gh)..."
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/etc/apt/keyrings/githubcli-archive-keyring.gpg
    sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=${ARCH} signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null
    sudo apt-get update
    sudo apt-get install -y gh
fi

# ------------------------------------------------------------------------------
# 4. Docker Engine & Docker Compose Plugin
# ------------------------------------------------------------------------------
if has_cmd docker; then
    log_ok "Docker bereits installiert: $(docker --version)"
else
    log_install "Installiere Docker Engine & Compose Plugin..."
    curl -fsSL https://get.docker.com | sudo sh
    sudo usermod -aG docker "$USER" || true
    log_info "Hinweis: Für rootless Docker-Zugriff ggf. neu anmelden (newgrp docker)."
fi

# ------------------------------------------------------------------------------
# 5. Terraform (HashiCorp)
# ------------------------------------------------------------------------------
if has_cmd terraform; then
    log_ok "Terraform bereits installiert: $(terraform version | head -n 1)"
else
    log_install "Installiere Terraform..."
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg >/dev/null
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list >/dev/null
    sudo apt-get update
    sudo apt-get install -y terraform
fi

# ------------------------------------------------------------------------------
# 6. Trivy (Aqua Security)
# ------------------------------------------------------------------------------
if has_cmd trivy; then
    log_ok "Trivy bereits installiert: $(trivy --version | head -n 1)"
else
    log_install "Installiere Trivy..."
    wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg >/dev/null
    echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb generic main" | sudo tee /etc/apt/sources.list.d/trivy.list >/dev/null
    sudo apt-get update
    sudo apt-get install -y trivy
fi

# ------------------------------------------------------------------------------
# 7. Gitleaks
# ------------------------------------------------------------------------------
if has_cmd gitleaks; then
    log_ok "Gitleaks bereits installiert: $(gitleaks version)"
else
    log_install "Installiere Gitleaks..."
    GITLEAKS_VER="$(curl -fsSL https://api.github.com/repos/gitleaks/gitleaks/releases/latest | jq -r '.tag_name | ltrimstr("v")')"
    curl -fsSL "https://github.com/gitleaks/gitleaks/releases/download/v${GITLEAKS_VER}/gitleaks_${GITLEAKS_VER}_linux_${GH_ARCH}.tar.gz" -o /tmp/gitleaks.tar.gz
    tar -xzf /tmp/gitleaks.tar.gz -C /tmp gitleaks
    sudo install -m 0755 /tmp/gitleaks /usr/local/bin/gitleaks
    rm -f /tmp/gitleaks.tar.gz /tmp/gitleaks
fi

# ------------------------------------------------------------------------------
# 8. kubectl (inkl. SHA256-Prüfung)
# ------------------------------------------------------------------------------
if has_cmd kubectl; then
    log_ok "kubectl bereits installiert: $(kubectl version --client 2>/dev/null | head -n 1)"
else
    log_install "Installiere kubectl..."
    KUBECTL_VER="$(curl -fsSL https://dl.k8s.io/release/stable.txt)"
    curl -fsSL "https://dl.k8s.io/release/${KUBECTL_VER}/bin/linux/${BIN_ARCH}/kubectl" -o /tmp/kubectl
    curl -fsSL "https://dl.k8s.io/release/${KUBECTL_VER}/bin/linux/${BIN_ARCH}/kubectl.sha256" -o /tmp/kubectl.sha256
    echo "$(cat /tmp/kubectl.sha256)  /tmp/kubectl" | sha256sum --check
    sudo install -o root -g root -m 0755 /tmp/kubectl /usr/local/bin/kubectl
    rm -f /tmp/kubectl /tmp/kubectl.sha256
fi

# ------------------------------------------------------------------------------
# 9. Minikube
# ------------------------------------------------------------------------------
if has_cmd minikube; then
    log_ok "Minikube bereits installiert: $(minikube version --short)"
else
    log_install "Installiere Minikube..."
    curl -fsSL "https://storage.googleapis.com/minikube/releases/latest/minikube-linux-${BIN_ARCH}" -o /tmp/minikube-linux
    sudo install -m 0755 /tmp/minikube-linux /usr/local/bin/minikube
    rm -f /tmp/minikube-linux
fi

# ------------------------------------------------------------------------------
# 10. Helm v3 (inkl. GPG-Fingerprint-Prüfung)
# ------------------------------------------------------------------------------
if has_cmd helm; then
    log_ok "Helm bereits installiert: $(helm version --short)"
else
    log_install "Installiere Helm v3..."
    HELM_KEY_ID="DDF78C3E6EBB2D2CC223C95C62BA89D07698DBC6"
    curl -fsSL https://packages.buildkite.com/helm-linux/helm-debian/gpgkey > /tmp/helm.asc
    if [ "$(gpg --import --import-options=show-only --with-colons /tmp/helm.asc | awk -F: '$1 == "fpr" {print $10}' | head -n 1)" != "$HELM_KEY_ID" ]; then
        echo "ERROR: Unerwarteter Helm APT Key Fingerprint!"
        rm -f /tmp/helm.asc
        exit 1
    fi
    sudo rm -f /etc/apt/sources.list.d/helm-stable-debian.list /usr/share/keyrings/helm.gpg
    sudo install -m 0644 -Dt /etc/apt/keyrings/ /tmp/helm.asc
    rm -f /tmp/helm.asc
    sudo tee /etc/apt/sources.list.d/helm-stable-debian.sources >/dev/null <<EOF
Types: deb
URIs: https://packages.buildkite.com/helm-linux/helm-debian/any/
Suites: any
Components: main
Signed-By: /etc/apt/keyrings/helm.asc
EOF
    sudo apt-get update
    sudo apt-get install -y helm
fi

# ------------------------------------------------------------------------------
# 11. Kubescape
# ------------------------------------------------------------------------------
if has_cmd kubescape; then
    log_ok "Kubescape bereits installiert: $(kubescape version 2>/dev/null || echo 'vorhanden')"
else
    log_install "Installiere Kubescape..."
    curl -fsSL https://raw.githubusercontent.com/kubescape/kubescape/master/install.sh | bash
fi

# ------------------------------------------------------------------------------
# 12. Prowler (Cloud 9 – Python Virtual Environment)
# ------------------------------------------------------------------------------
if has_cmd prowler || [ -x "./prowler-env/bin/prowler" ]; then
    log_ok "Prowler bereits vorhanden."
else
    log_info "Hinweis: Für Cloud 9 kann Prowler isoliert via 'single_cmd_collection/cloud9/01_setup_prowler_venv.sh' in ./prowler-env eingerichtet werden."
fi

# ------------------------------------------------------------------------------
# 13. SSH-Key & Gruppen-Check
# ------------------------------------------------------------------------------
if [ -f "$HOME/.ssh/id_ed25519.pub" ] || [ -f "$HOME/.ssh/id_rsa.pub" ]; then
    log_ok "SSH Public Key gefunden unter ~/.ssh/"
else
    log_info "Kein SSH-Key in ~/.ssh/ gefunden. Bei Bedarf erzeugen mit: ssh-keygen -t ed25519"
fi

echo ""
log_ok "Initialisierung & Tool-Prüfung abgeschlossen."
