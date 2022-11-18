{{- define "post.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name }}
{{- end -}}

{{- define "post.image" -}}
{{- printf "%s:%s" .Values.image.repository .Values.image.tag }}
{{- end -}}
