{{- define "frontend.name" -}}
{{ .Chart.Name }}
{{- end }}

{{- define "frontend.fullname" -}}
{{ include "frontend.name" . }}-{{ .Release.Name }}
{{- end }}

{{- define "frontend.labels" -}}
app.kubernetes.io/name: {{ include "frontend.name" . }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
