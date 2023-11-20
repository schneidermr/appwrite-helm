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
    {{- if .Values.global.imagePullSecrets }}
    imagePullSecrets:
      {{- toYaml .Values.global.imagePullSecrets | nindent 6 }}
    {{- end }}
    {{- with .component.config.podSecurityContext }}
    securityContext:
      {{- toYaml . | nindent 6 }}
    {{- end }}
    containers:
      - name: {{ .component.name }}
        {{- with .component.config.containerSecurityContext }}
        securityContext:
          {{- toYaml . | nindent 10 }}
        {{- end }}
        image: {{ include "getimage" .component.config.image }}
        imagePullPolicy: {{ .component.config.image.pullPolicy }}
        {{- with .component.config.command }}
        command:
          {{- toYaml . | nindent 10 }}
        {{- end }}
        {{- with .component.config.args }}
        args:
          {{- toYaml . | nindent 10 }}
        {{- end }}
        {{- with .component.config.ports }}
        ports:
          {{- toYaml . | nindent 10 }}
        {{- end }}
        {{- with .component.config.livenessProbe }}
        livenessProbe:
          {{- toYaml . | nindent 10 }}
        {{- end }}
        {{- with .component.config.readinessProbe }}
        readinessProbe:
          {{- toYaml . | nindent 10 }}
        {{- end }}
        {{- with .component.config.resources }}
        resources:
          {{- toYaml . | nindent 10 }}
        {{- end }}
        restartPolicy: {{ .component.config.restartPolicy }}
        {{- if and (kindIs "bool" .component.config.env) .component.config.env }}
        envFrom:
          - configMapRef:
              name: {{ printf "%s-env" (include "appwrite.fullname" .) }}
          - secretRef:
              name: {{ printf "%s-env" (include "appwrite.fullname" .) }}
        {{- else if .component.config.env }}
        env:
          {{ toYaml . | nindent 10 }}
        {{- end }}
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