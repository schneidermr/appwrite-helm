{{/* Allow the release namespace to be overridden */}}
{{- define "appwrite.namespace" -}}
{{- .Release.Namespace }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "appwrite.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "appwrite.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of: appwrite
{{- end }}

{{- define "appwrite.podLabels" -}}
{{- with .Values.podLabels }}
{{- toYaml . }}
{{- end }}
{{- end }}

{{- define "appwrite.podAnnotations" -}}
{{- if and .Values.podAnnotations .component.config.podAnnotations }}
{{- merge .component.config.podAnnotations .Values.podAnnotations | toYaml }}
{{- else if .Values.podAnnotations }}
{{- toYaml .Values.podAnnotations }}
{{- else if .component.config.podAnnotations }}
{{- toYaml .component.config.podAnnotations }}
{{- end }}
{{- end }}

{{- define "getimage" -}}
{{- printf "%s/%s:%s" .registry .repository .tag }}
{{- end }}