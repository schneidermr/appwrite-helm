{{/* Define a template for the StatefulSet kind objects */}}
{{- define "appwrite.statefulset" -}}
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: {{ printf "%s-%s" (include "appwrite.fullname" .) .component.name | trunc 63 }}
  namespace: {{ include "appwrite.namespace" . }}
  labels:
    app.kubernetes.io/name: {{ printf "%s-%s" (include "appwrite.fullname" .) .component.name | trunc 63 }}
    app.kubernetes.io/component: {{ .component.name }}
    {{- include "appwrite.labels" . | nindent 4 }}
spec:
  serviceName: {{ printf "%s-%s" (include "appwrite.fullname" .) .component.name | trunc 63 }}
  {{- if not .component.config.autoscaling.enabled }}
  replicas: {{ .component.config.replicaCount }}
  {{- end }}
#  minReadySeconds: 10
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
        {{- include "appwrite.labels" . | nindent 8 }}
  spec:
    {{- include "appwrite.pod" . | indent 4 -}}
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
      maxUnavailable: {{ .component.config.deploymentStrategy.maxUnavailable | default 1 }}
  revisionHistoryLimit: 5
  volumeClaimTemplates:
  - metadata:
      name: storage
    spec:
      accessModes: [ "ReadWriteMany" ]
      storageClassName: {{ .Values.global.storageClass }}
      resources:
        requests:
          storage: 1Gi
  {{- if semverCompare ">=1.27" .Capabilities.KubeVersion.Version }}
  persistentVolumeClaimRetentionPolicy:
    whenDeleted: Retain
    whenScaled: Delete
  {{- end }}
{{- end -}}