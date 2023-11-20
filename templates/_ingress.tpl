{{/* Define a template for the Ingress kind objects */}}
{{- define "appwrite.ingress" -}}
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: {{ printf "%s-%s" (include "appwrite.fullname" .) .component.name | trunc 63 }}
  namespace: {{ include "appwrite.namespace" . }}
  labels:
    app.kubernetes.io/name: {{ printf "%s-%s" (include "appwrite.fullname" .) .component.name | trunc 63 }}
    app.kubernetes.io/component: {{ .component.name }}
    {{- include "appwrite.labels" . | nindent 4 }}
  {{- with .component.config.ingress.annotations }}
  annotations:
    {{- toYaml . | nindent 4 }}
  {{- end }}
spec:
  ingressClassName: {{ .component.config.ingress.className }}
  {{- with .component.config.ingress.rules }}
  rules:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .component.config.ingress.tls }}
  tls:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}