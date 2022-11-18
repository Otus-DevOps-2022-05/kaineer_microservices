{{- define "comment.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name }}
{{- end -}}

{{- define "comment.image" -}}
{{- printf "%s:%s" .Values.image.repository .Values.image.tag }}
{{- end -}}
