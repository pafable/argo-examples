{{- define "my-app.name" -}}
{{- if eq .Values.app.env.NODE_ENV "development" -}}
{{ .Values.app.name }}-dev
{{ else if eq .Values.app.env.NODE_ENV "production" -}}
{{ .Values.app.name }}-prod
{{ else }}
{{ fail "Entry in .Values.app.env.NODE_ENV is not recognized" }}
{{ end }}
{{- end }}

{{- define "my-app.namespace" -}}
{{- default .Release.Namespace .Values.namespaceOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "my-app.ingressClassName" -}}
{{- default "ingress-nginx" .Values.ingressClassName | trunc 63 | trimSuffix "-" -}}
{{- end }}
