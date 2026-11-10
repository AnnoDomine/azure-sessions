#!/usr/bin/env bash
# ==============================================================================
# 24. STATEFULSET-MANIFESTE (NAMESPACE, SERVICE & STATEFULSET) ERZEUGEN
# ==============================================================================
# Erzeugt drei Kubernetes-Manifeste für die persistente Stateful-Workload:
# 1. 'namespace.yaml'  : Namespace für die Stateful-App ($SF_NS = demo3-statefulset)
# 2. 'service.yaml'    : LoadBalancer-Service zur externen Exposition auf Port 80 -> 8080
# 3. 'statefulset.yaml': StatefulSet mit 1 Replikat (python:3.11-slim), ConfigMap-Mount
#                        und VolumeClaimTemplate (1Gi Azure Managed Disk dynamisch provisioniert).
#
# Korrekturhinweis:
# Im ursprünglichen Skript stand fälschlicherweise '${demo3-statefulset}' statt '${SF_NS}',
# was zu fehlerhaften YAML-Deklarationen führte. Dies wurde hier korrigiert.

cat << EOF > "./namespace.yaml"
apiVersion: v1
kind: Namespace
metadata:
  name: ${SF_NS}
EOF

cat << EOF > "./service.yaml"
apiVersion: v1
kind: Service
metadata:
  name: demo3-service
  namespace: ${SF_NS}
  labels:
    app: demo3
spec:
  type: LoadBalancer
  ports:
    - port: 80
      name: web
      targetPort: 8080
  selector:
    app: demo3
EOF

cat << EOF > "./statefulset.yaml"
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: demo3
  namespace: ${SF_NS}
  labels:
    app: demo3
spec:
  serviceName: demo3-service
  replicas: 1
  selector:
    matchLabels:
      app: demo3
  template:
    metadata:
      labels:
        app: demo3
    spec:
      containers:
        - name: demo3
          image: python:3.11-slim
          ports:
            - containerPort: 8080
              name: web
              protocol: TCP
          volumeMounts:
            - name: data
              mountPath: /data/notes
            - name: config
              mountPath: /app
          env:
            - name: POD_NAME
              valueFrom:
                fieldRef:
                  fieldPath: metadata.name
            - name: POD_NAMESPACE
              valueFrom:
                fieldRef:
                  fieldPath: metadata.namespace
            - name: PYTHONUNBUFFERED
              value: "1"
          command: ["python3"]
          args: ["/app/app.py"]
          resources:
            requests:
              memory: "128Mi"
              cpu: "100m"
            limits:
              memory: "256Mi"
              cpu: "200m"
          livenessProbe:
            httpGet:
              path: /health
              port: 8080
            initialDelaySeconds: 10
            periodSeconds: 30
            timeoutSeconds: 5
            failureThreshold: 3
          readinessProbe:
            httpGet:
              path: /health
              port: 8080
            initialDelaySeconds: 5
            periodSeconds: 10
            timeoutSeconds: 5
            failureThreshold: 3
      volumes:
        - name: config
          configMap:
            name: demo3-config
  volumeClaimTemplates:
    - metadata:
        name: data
      spec:
        accessModes:
          - ReadWriteOnce
        resources:
          requests:
            storage: 1Gi
EOF
