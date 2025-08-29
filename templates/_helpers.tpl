{{- define "myimage" -}}
{{ .Values.image.repository }}/{{ .Values.image.name }}:{{ .Values.image.tag }}
{{- end -}}

{{- define "mylabels" -}}
{{ .Values.labels | toYaml }}
{{- end -}}

{{- define "mysqlport" -}}
{{- range .Values.ports }}
- port: {{ .port }}
  targetPort: {{ .targetPort }}
  protocol: {{ .protocol }}
  {{- if eq $.Values.service.type "NodePort" }}
  nodePort: {{ .nodePort }}
  {{- end }}
{{- end }}
{{- end }}

{{- define "envsecret" -}}
{{- $root := . -}}
{{ range $key, $value := .Values.env }}
- name: {{ $key }}
  valueFrom:
    secretKeyRef:
      name: {{ $root.Values.secrets.name }}
      key: {{ $value }}
{{- end -}}
{{- end -}}

{{- define "servicedns" -}}
{{ .Values.labels.app }}-svc.{{ .Values.namespace }}.svc.cluster.local
{{- end -}}
