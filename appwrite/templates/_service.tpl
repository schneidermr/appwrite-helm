{{/* Define a template for the Service kind objects */}}
{{- define "appwrite.service" -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ printf "%s-%s" (include "appwrite.fullname" .) .component.name | trunc 63 }}
  namespace: {{ include "appwrite.namespace" . }}
  labels:
    app.kubernetes.io/name: {{ printf "%s-%s" (include "appwrite.fullname" .) .component.name | trunc 63 }}
    app.kubernetes.io/component: {{ .component.name }}
    {{- include "appwrite.labels" . | nindent 4 }}
spec:
  selector:
    app.kubernetes.io/name: {{ printf "%s-%s" (include "appwrite.fullname" .) .component.name | trunc 63 }}
  {{- with .component.config.service }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
{{- end }}