#!/usr/bin/env bash
# ==============================================================================
# 14. KUBERNETES DEPLOYMENT-MANIFEST ERZEUGEN
# ==============================================================================
# Erzeugt deklarativ die Datei 'deployment.yaml' für ein Kubernetes-Deployment,
# welches das zuvor in die ACR hochgeladene Container-Image referenziert.
# Variablen:
#   $ACR_DEMO_NAME  : Name des Deployments und der App-Labels (acr-image-demo)
#   $CONTAINER_LINK : Vollständiger Image-Pfad in der ACR (<acr>.azurecr.io/<container>:latest)

cat << EOF > "./deployment.yaml"
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ${ACR_DEMO_NAME}
  labels:
    app: ${ACR_DEMO_NAME}
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ${ACR_DEMO_NAME}
  template:
    metadata:
      labels:
        app: ${ACR_DEMO_NAME}
    spec:
      containers:
        - name: app
          image: ${CONTAINER_LINK}
          ports:
            - containerPort: 80
EOF
