{{- define "ui.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name }}
{{- end -}}

{{- define "ui.image" -}}
{{- printf "%s:%s" .Values.image.repository .Values.image.tag }}
{{- end -}}
