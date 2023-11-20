{{/* Define a template for the PodDisruptionBudget kind objects */}}
{{- define "appwrite.pdb" -}}
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: {{ printf "%s-%s" (include "appwrite.fullname" .) .component.name | trunc 63 }}
  namespace: {{ include "appwrite.namespace" . }}
  labels:
    app.kubernetes.io/name: {{ printf "%s-%s" (include "appwrite.fullname" .) .component.name | trunc 63 }}
    app.kubernetes.io/component: {{ .component.name }}
    {{- include "appwrite.labels" . | nindent 4 }}
spec:
  selector:
    matchLabels:
      app.kubernetes.io/name: {{ printf "%s-%s" (include "appwrite.fullname" .) .component.name | trunc 63 }}
  {{- with .component.config.podDisruption}}
    {{- toYaml . | nindent 2 }}
  {{- end }}
{{- end }}