{{/* Labels common to every object (selector labels are kept separate and minimal). */}}
{{- define "dso202.labels" -}}
course: dso202
assignment: "2"
app.kubernetes.io/part-of: dso202-app
app.kubernetes.io/environment: {{ .Values.environment | quote }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{/* Annotation that rolls pods whenever ConfigMap or Secret content changes
     (Helm's equivalent of Kustomize's generated-name hash). */}}
{{- define "dso202.checksums" -}}
checksum/config: {{ include (print $.Template.BasePath "/configmap.yaml") . | sha256sum }}
checksum/secret: {{ include (print $.Template.BasePath "/secret.yaml") . | sha256sum }}
{{- end -}}
