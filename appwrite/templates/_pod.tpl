{{/* Define a template for pod */}}
{{- define "appwrite.pod" -}}
{{- if .Values.global.imagePullSecrets -}}
imagePullSecrets:
  {{- toYaml .Values.global.imagePullSecrets | nindent 4 }}
{{- end }}
{{- with .component.config.podSecurityContext }}
securityContext:
  {{- toYaml . | nindent 2 }}
{{- end }}
restartPolicy: {{ .component.config.restartPolicy }}
{{- if .component.config.test }}
initContainers:
  {{- $configname := (printf "%s-env" (include "appwrite.fullname" .)) -}}
  {{- range $i, $v := .component.config.test }}
  - name: "dependency-test-{{ $i }}"
    image: ghcr.io/schneidermr/kubernetes-tools:telnet-test
    env:
      - name: TEST_HOST
        valueFrom:
          configMapKeyRef:
            name: {{ $configname }}
            key: {{ $v.hostkey }}
      - name: TEST_PORT
        valueFrom:
          configMapKeyRef:
            name: {{ $configname }}
            key: {{ $v.portkey }}
  {{- end }}
{{- end }}
containers:
  - name: {{ .component.name }}
    {{- with .component.config.containerSecurityContext }}
    securityContext:
      {{- toYaml . | nindent 6 }}
    {{- end }}
    image: {{ include "getimage" .component.config.image }}
    imagePullPolicy: {{ .component.config.image.pullPolicy }}
    {{- with .component.config.command }}
    command:
      {{- toYaml . | nindent 6 }}
    {{- end }}
    {{- with .component.config.args }}
    args:
      {{- toYaml . | nindent 6 }}
    {{- end }}
    {{- with .component.config.ports }}
    ports:
      {{- toYaml . | nindent 6 }}
    {{- end }}
    {{- with .component.config.livenessProbe }}
    livenessProbe:
      {{- toYaml . | nindent 6 }}
    {{- end }}
    {{- with .component.config.readinessProbe }}
    readinessProbe:
      {{- toYaml . | nindent 6 }}
    {{- end }}
    {{- with .component.config.resources }}
    resources:
      {{- toYaml . | nindent 6 }}
    {{- end }}
    {{- if and (kindIs "bool" .component.config.env) .component.config.env }}
    envFrom:
      - configMapRef:
          name: {{ printf "%s-env" (include "appwrite.fullname" .) }}
      - secretRef:
          name: {{ printf "%s-env" (include "appwrite.fullname" .) }}
    {{- else if .component.config.env }}
    env:
      {{ toYaml . | nindent 6 }}
    {{- end }}
    {{- if eq .component.name "core" }}
    volumeMounts:
    - name: storage
      mountPath: /storage
    {{- end }}
{{- end }}