{{/*
Define the cluster componnets with proxy.
The proxy cpu cores is 1/6 of the cluster total cpu cores and is multiple of 0.5.
The minimum proxy cpu cores is 0.5 and the maximum cpu cores is 64.
*/}}
{{- define "wesql-cluster.proxyComponents" }}
{{- $replicas := .Values.replicas }}
{{- $proxyCPU := divf (mulf $replicas .Values.cpu) 6.0 }}
{{- $proxyCPU = divf $proxyCPU 0.5 | ceil | mulf 0.5 }}
{{- if lt $proxyCPU 0.5 }}
{{- $proxyCPU = 0.5 }}
{{- else if gt $proxyCPU 64.0 }}
{{- $proxyCPU = 64 }}
{{- end }}
- name: wescale-ctrl
  {{- if eq .Values.topology "wesql-proxy" }}
  serviceRefs:
    {{ include "wesql-cluster.serviceRef" . | indent 4 }}
  {{- end }}
  volumeClaimTemplates:
    - name: data
      spec:
        storageClassName: {{ .Values.proxy.storageClassName | quote }}
        accessModes:
          - ReadWriteOnce
        resources:
          requests:
            storage: 20Gi
  replicas: 1
  resources:
    limits:
      cpu: 500m
      memory: 128Mi
- name: wescale
  {{- if eq .Values.topology "wesql-proxy" }}
  serviceRefs:
    {{ include "wesql-cluster.serviceRef" . | indent 4 }}
  {{- end }}
  replicas: 1
  resources:
    requests:
      cpu: {{ $proxyCPU | quote }}
      memory: 500Mi
    limits:
      cpu: {{ $proxyCPU | quote }}
      memory: 500Mi
{{- end }}

{{- define "wesql-cluster.serviceRef" }}
- name: etcd
  namespace: {{ .Release.Namespace }}
  serviceDescriptor: {{ include "kblib.clusterName" . }}-etcd-descriptor
{{- end -}}

{{- define "wesql-cluster.etcdComponents" }}
- name: etcd
  volumeClaimTemplates:
    - name: data
      spec:
        storageClassName: {{ .Values.proxy.storageClassName | quote }}
        accessModes:
          - ReadWriteOnce
        resources:
          requests:
            storage: {{ .Values.etcd.resources.storage }}
  replicas: {{ .Values.etcd.replicas }}
  resources:
    requests:
      cpu: 500m
      memory: 500Mi
    limits:
      cpu: 500m
      memory: 500Mi
{{- end -}}

{{- define "wesql-cluster.schedulingPolicy" }}
schedulingPolicy:
  affinity:
    podAntiAffinity:
      preferredDuringSchedulingIgnoredDuringExecution:
      - podAffinityTerm:
          labelSelector:
            matchLabels:
              app.kubernetes.io/instance: {{ include "kblib.clusterName" . }}
              apps.kubeblocks.io/component-name: wesql-server
          topologyKey: kubernetes.io/hostname
        weight: 100
{{- end -}}