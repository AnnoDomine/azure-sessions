#!/usr/bin/env bash
# ==============================================================================
# 20. MANIFESTE FÜR NGINX-LOADBALANCER-DEMO ERSTELLEN
# ==============================================================================
# Erzeugt drei Kubernetes-Manifeste für eine skalierte Web-Workload:
# 1. 'namespace.yaml'       : Eigener Namespace 'demo2-loadbalancer'
# 2. 'nginx-deployment.yaml': Deployment mit 3 Nginx-Replikaten inkl. CPU/Memory Requests & Limits
# 3. 'nginx-service.yaml'   : Service vom Typ 'LoadBalancer' auf Port 80
# Variablen:
#   $LB_NS : Name des Namespaces (demo2-loadbalancer)
#   $NG_LB : Name des Services (nginx-loadbalancer)

cat << EOF > "./namespace.yaml"
apiVersion: v1
kind: Namespace
metadata:
  name: ${LB_NS}
  labels:
    app: nginx-demo
    demo: "2"
EOF

cat << EOF > "./nginx-deployment.yaml"
apiVersion: apps/v1
kind: Deployment
metadata:
  namespace: ${LB_NS}
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx:latest
          ports:
            - containerPort: 80
          resources:
            requests:
              memory: "64Mi"
              cpu: "100m"
            limits:
              memory: "128Mi"
              cpu: "500m"
EOF

cat << EOF > "./nginx-service.yaml"
apiVersion: v1
kind: Service
metadata:
  namespace: ${LB_NS}
  name: ${NG_LB}
  labels:
    app: nginx
spec:
  type: LoadBalancer
  selector:
    app: nginx
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
EOF
