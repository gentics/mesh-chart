{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "mesh.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "mesh.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}


{{/*
Create a default fully qualified app name. WITHOUT override
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "mesh.fullname.no.override" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "mesh.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{- define "mesh.host" -}}
{{- printf "%s.%s.%s" .Chart.Name .Release.Name .Values.global.domain | trimSuffix "-" -}}
{{- end -}}

{{- define "mesh.host-replicas" -}}
{{- printf "%s-replicas.%s.%s" .Chart.Name .Release.Name .Values.global.domain | trimSuffix "-" -}}
{{- end -}}

{{- define "mesh.host-backup-explorer" -}}
{{- printf "%s-backup-explorer.%s.%s" .Chart.Name .Release.Name .Values.global.domain | trimSuffix "-" -}}
{{- end -}}

{{- define "mesh.host-internal" -}}
{{- printf "%s.%s.internal.%s" .Chart.Name .Release.Name .Values.global.domain | trimSuffix "-" -}}
{{- end -}}

{{- define "mesh.version.slug" -}}
{{- printf "%s" .Values.image.tag | replace "." "-" -}}
{{- end -}}

{{- define "certificate.fullname" -}}
{{- printf "%s.%s-tls" .Release.Name .Values.global.domain | trimSuffix "-" -}}
{{- end -}}

# in this particuliar case (persistance without nfs) we use mesh-data-master to store uploads

{{- define "mesh.nfs.name" -}}
{{- if and (eq .Values.persistence.nfs.enabled false) (eq .Values.persistence.enabled true) -}}
mesh-data-master
{{- else -}}
mesh-uploads
{{- end -}}
{{- end -}}