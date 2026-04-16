{{/*
Expand the name of the chart.
*/}}
{{- define "scraparr.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "scraparr.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "scraparr.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "scraparr.labels" -}}
helm.sh/chart: {{ include "scraparr.chart" . }}
{{ include "scraparr.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "scraparr.selectorLabels" -}}
app.kubernetes.io/name: {{ include "scraparr.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Scraparr metrics endpoint
*/}}
{{- define "scraparr.endpoint" -}}
{{- if and .Values.config .Values.config.general .Values.config.general.path }}
{{- .Values.config.general.path }}
{{- else }}
{{- printf "/metrics" }}
{{- end }}
{{- end }}

{{/*
Process the scraparr config, transforming structured api_key objects:
  - type "literal": replaced with the plain string value (api_key.value)
  - type "ref":     replaced with ${api_key.name} for env var interpolation
  - plain string:   passed through unchanged (backward compatible)
*/}}
{{- define "scraparr.processConfig" -}}
{{- $result := dict -}}
{{- range $service, $instances := . -}}
  {{- if kindIs "slice" $instances -}}
    {{- $newInstances := list -}}
    {{- range $instance := $instances -}}
      {{- $newInstance := dict -}}
      {{- range $k, $v := $instance -}}
        {{- if and (eq $k "api_key") (kindIs "map" $v) -}}
          {{- if eq $v.type "literal" -}}
            {{- $newInstance = set $newInstance "api_key" $v.value -}}
          {{- else if eq $v.type "ref" -}}
            {{- $newInstance = set $newInstance "api_key" (printf "${%s}" $v.name) -}}
          {{- end -}}
        {{- else -}}
          {{- $newInstance = set $newInstance $k $v -}}
        {{- end -}}
      {{- end -}}
      {{- $newInstances = append $newInstances $newInstance -}}
    {{- end -}}
    {{- $result = set $result $service $newInstances -}}
  {{- else -}}
    {{- $result = set $result $service $instances -}}
  {{- end -}}
{{- end -}}
{{- $result | toYaml -}}
{{- end }}