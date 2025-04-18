{{/*
Expand the name of the chart.
*/}}
{{- define "llm.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "llm.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "llm.labels" -}}
helm.sh/chart: {{ include "llm.chart" . }}
{{ include "llm.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "llm.selectorLabels" -}}
app.kubernetes.io/name: {{ include "llm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common annotations
*/}}
{{- define "llm.annotations" -}}
{{ include "llm.apiVersion" . }}
{{- end }}

{{/*
API version annotation
*/}}
{{- define "llm.apiVersion" -}}
kubeblocks.io/crd-api-version: apps.kubeblocks.io/v1
{{- end }}



{{/*
Define vllm component definition name
*/}}
{{- define "llm.cmpdNameVLLM" -}}
llm-vllm-{{ .Chart.Version }}
{{- end -}}

{{/*
Define ggml component definition name
*/}}
{{- define "llm.cmpdNameGGML" -}}
llm-ggml-{{ .Chart.Version }}
{{- end -}}