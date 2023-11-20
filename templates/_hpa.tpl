{{/* Define a template for the HorizontalPodAutoscaler kind objects */}}
{{- define "appwrite.autoscaling" -}}
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: {{ printf "%s-%s" (include "appwrite.fullname" .) .component.name | trunc 63 }}
  namespace: {{ include "appwrite.namespace" . }}
  labels:
    app.kubernetes.io/name: {{ printf "%s-%s" (include "appwrite.fullname" .) .component.name | trunc 63 }}
    app.kubernetes.io/component: {{ .component.name }}
    {{- include "appwrite.labels" . | nindent 4 }}
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: {{ .persistent | ternary "StatefulSet" "Deployment" }}
    name: {{ printf "%s-%s" (include "appwrite.fullname" .) .component.name | trunc 63 }}
  minReplicas: {{ .component.config.autoscaling.minReplicas }}
  maxReplicas: {{ .component.config.autoscaling.maxReplicas }}
  metrics:
    {{- if .component.config.autoscaling.targetCPU }}
    - type: Resource
      resource:
        name: cpu
        target:
          type: Utilization
          averageUtilization: {{ .component.config.autoscaling.targetCPU }}
    {{- end }}
    {{- if .component.config.autoscaling.targetMemory }}
    - type: Resource
      resource:
        name: memory
        target:
          type: Utilization
          averageUtilization: {{ .component.config.autoscaling.targetMemory }}
    {{- end }}
{{- end }}
