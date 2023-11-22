{{/* Define a template for the Deployment kind objects */}}
{{- define "appwrite.deployment" -}}
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ printf "%s-%s" (include "appwrite.fullname" .) .component.name | trunc 63 }}
  namespace: {{ include "appwrite.namespace" . }}
  labels:
    app.kubernetes.io/name: {{ printf "%s-%s" (include "appwrite.fullname" .) .component.name | trunc 63 }}
    app.kubernetes.io/component: {{ .component.name }}
    {{- include "appwrite.labels" . | nindent 4 }}
spec:
  {{- if not .component.config.autoscaling.enabled }}
  replicas: {{ .component.config.replicaCount }}
  {{- end }}
  selector:
    matchLabels:
      app.kubernetes.io/name: {{ printf "%s-%s" (include "appwrite.fullname" .) .component.name | trunc 63 }}
  template:
    metadata:
      {{- with (include "appwrite.podAnnotations" .) }}
      annotations:
        {{- . | nindent 8 }}
      {{- end }}
      labels:
        app.kubernetes.io/name: {{ printf "%s-%s" (include "appwrite.fullname" .) .component.name | trunc 63 }}
        app.kubernetes.io/component: {{ .component.name }}
        {{- include "appwrite.labels" . | nindent 8}}
  spec:
    {{- include "appwrite.pod" . | nindent 4 -}}
  {{- with .component.config.nodeSelector }}
  nodeSelector:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .component.config.affinity }}
  affinity:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .component.config.tolerations }}
  tolerations:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  strategy:
    type: {{ .component.config.deploymentStrategy.type }}
    rollingUpdate:
      maxUnavailable: {{ .component.config.deploymentStrategy.maxUnavailable }}
  revisionHistoryLimit: 5
{{- end }}