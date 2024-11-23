# appwrite-helm

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.6.0](https://img.shields.io/badge/AppVersion-1.6.0-informational?style=flat-square)

An unofficial Helm chart to deploy Appwrite

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Marton Schneider |  | <https://github.com/schneidermr> |

## Requirements

Kubernetes: `>=1.26`

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | influxdb | 5.10.2 |
| https://charts.bitnami.com/bitnami | mariadb | 14.1.2 |
| https://charts.bitnami.com/bitnami | redis | 18.4.0 |
| https://helm.influxdata.com/ | telegraf | 1.8.38 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| clusterDomain | string | `"cluster.local"` | The domain name of the Kubernetes cluster |
| components.console.affinity | object | `{}` |  |
| components.console.autoscaling | object | `{"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPU":"60","targetMemory":""}` | Setup autoscaling to enable HPA (HorizontalPodAutoscaler).  To enable autoscaling also need to configure the resource limits |
| components.console.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| components.console.containerSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| components.console.deploymentStrategy.maxUnavailable | int | `1` |  |
| components.console.deploymentStrategy.type | string | `"RollingUpdate"` |  |
| components.console.env | bool | `false` | Attach previously defined environment variables to the pod |
| components.console.image.pullPolicy | string | `"IfNotPresent"` |  |
| components.console.image.registry | string | `"docker.io"` |  |
| components.console.image.repository | string | `"appwrite/console"` |  |
| components.console.image.tag | string | `"5.0.12"` |  |
| components.console.ingress.annotations | object | `{}` |  |
| components.console.ingress.className | string | `""` |  |
| components.console.ingress.enabled | bool | `false` |  |
| components.console.ingress.rules[0].host | string | `"localhost"` |  |
| components.console.ingress.rules[0].http.paths[0].backend.service.name | string | `"appwrite-console-svc"` |  |
| components.console.ingress.rules[0].http.paths[0].backend.service.port.number | int | `80` |  |
| components.console.ingress.rules[0].http.paths[0].path | string | `"/"` |  |
| components.console.ingress.rules[0].http.paths[0].pathType | string | `"Prefix"` |  |
| components.console.ingress.tls | list | `[]` |  |
| components.console.livenessProbe | object | `{"failureThreshold":10,"httpGet":{"path":"/","port":80},"initialDelaySeconds":30,"timeoutSeconds":30}` | Define the liveness probe |
| components.console.networkPolicy.egress[0] | object | `{}` |  |
| components.console.networkPolicy.enabled | bool | `false` |  |
| components.console.networkPolicy.ingress[0].from[0].ipBlock.cidr | string | `"0.0.0.0/0"` |  |
| components.console.networkPolicy.ingress[0].from[1].namespaceSelector.matchLabels.namespace | string | `"default"` |  |
| components.console.networkPolicy.ingress[0].ports[0].port | int | `80` |  |
| components.console.networkPolicy.ingress[0].ports[0].protocol | string | `"TCP"` |  |
| components.console.networkPolicy.policyTypes[0] | string | `"Ingress"` |  |
| components.console.nodeSelector | object | `{}` |  |
| components.console.podAnnotations | object | `{}` | The annotations that the application's pod will get. Will be extended with the common pod labels, what is defined in the global. |
| components.console.podDisruption.config | string | `nil` |  |
| components.console.podDisruption.enabled | bool | `false` |  |
| components.console.podLabels | object | `{}` | The labels that the application's pod will get. Will be extended with the common pod labels, what is defined in the global. |
| components.console.podSecurityContext.fsGroup | int | `0` |  |
| components.console.podSecurityContext.fsGroupChangePolicy | string | `"OnRootMismatch"` |  |
| components.console.podSecurityContext.runAsGroup | int | `0` |  |
| components.console.podSecurityContext.runAsNonRoot | bool | `false` |  |
| components.console.podSecurityContext.runAsUser | int | `0` |  |
| components.console.ports[0].containerPort | int | `80` |  |
| components.console.ports[0].name | string | `"http"` |  |
| components.console.ports[0].protocol | string | `"TCP"` |  |
| components.console.readinessProbe | object | `{"httpGet":{"path":"/","port":80}}` | Define the rediness probe |
| components.console.replicaCount | int | `1` | The number of instances in which the application will run. Only effect if autoscaling false |
| components.console.resources | object | `{}` | Setup resource limits and requests for the app |
| components.console.restartPolicy | string | `"Always"` |  |
| components.console.service.ports[0].name | string | `"http"` |  |
| components.console.service.ports[0].port | int | `80` |  |
| components.console.service.ports[0].protocol | string | `"TCP"` |  |
| components.console.service.ports[0].targetPort | int | `80` |  |
| components.console.service.type | string | `"ClusterIP"` |  |
| components.console.tolerations | list | `[]` |  |
| components.core.affinity | object | `{}` |  |
| components.core.autoscaling | object | `{"behavior":{},"enabled":false,"maxReplicas":5,"minReplicas":1,"targetCPU":"60","targetMemory":""}` | Setup autoscaling to enable HPA (HorizontalPodAutoscaler).  To enable autoscaling also need to configure the resource limits |
| components.core.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| components.core.containerSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| components.core.deploymentStrategy.maxUnavailable | int | `1` |  |
| components.core.deploymentStrategy.type | string | `"RollingUpdate"` |  |
| components.core.env | bool | `true` | Attach previously defined environment variables to the pod |
| components.core.image.pullPolicy | string | `"IfNotPresent"` |  |
| components.core.image.registry | string | `"docker.io"` |  |
| components.core.image.repository | string | `"appwrite/appwrite"` |  |
| components.core.image.tag | string | `"1.6.0"` |  |
| components.core.ingress.annotations | object | `{}` |  |
| components.core.ingress.className | string | `""` |  |
| components.core.ingress.enabled | bool | `false` |  |
| components.core.ingress.rules[0].host | string | `"localhost"` |  |
| components.core.ingress.rules[0].http.paths[0].backend.service.name | string | `"appwrite-app-svc"` |  |
| components.core.ingress.rules[0].http.paths[0].backend.service.port.number | int | `80` |  |
| components.core.ingress.rules[0].http.paths[0].path | string | `"/"` |  |
| components.core.ingress.rules[0].http.paths[0].pathType | string | `"Prefix"` |  |
| components.core.ingress.tls | list | `[]` |  |
| components.core.livenessProbe | object | `{"failureThreshold":10,"httpGet":{"path":"/","port":80},"initialDelaySeconds":30,"timeoutSeconds":30}` | Define the liveness probe |
| components.core.networkPolicy.egress[0] | object | `{}` |  |
| components.core.networkPolicy.enabled | bool | `false` |  |
| components.core.networkPolicy.ingress[0].from[0].ipBlock.cidr | string | `"0.0.0.0/0"` |  |
| components.core.networkPolicy.ingress[0].from[1].namespaceSelector.matchLabels.namespace | string | `"default"` |  |
| components.core.networkPolicy.ingress[0].ports[0].port | int | `80` |  |
| components.core.networkPolicy.ingress[0].ports[0].protocol | string | `"TCP"` |  |
| components.core.networkPolicy.policyTypes[0] | string | `"Ingress"` |  |
| components.core.nodeSelector | object | `{}` |  |
| components.core.podAnnotations | object | `{}` | The annotations that the application's pod will get. Will be extended with the common pod labels, what is defined in the global. |
| components.core.podDisruption.config | string | `nil` |  |
| components.core.podDisruption.enabled | bool | `false` |  |
| components.core.podLabels | object | `{}` | The labels that the application's pod will get. Will be extended with the common pod labels, what is defined in the global. |
| components.core.podSecurityContext.fsGroup | int | `0` |  |
| components.core.podSecurityContext.fsGroupChangePolicy | string | `"OnRootMismatch"` |  |
| components.core.podSecurityContext.runAsGroup | int | `0` |  |
| components.core.podSecurityContext.runAsNonRoot | bool | `false` |  |
| components.core.podSecurityContext.runAsUser | int | `0` |  |
| components.core.ports[0].containerPort | int | `80` |  |
| components.core.ports[0].name | string | `"http"` |  |
| components.core.ports[0].protocol | string | `"TCP"` |  |
| components.core.readinessProbe | object | `{"httpGet":{"path":"/","port":80}}` | Define the rediness probe |
| components.core.replicaCount | int | `1` | The number of instances in which the application will run. Only effect if autoscaling false |
| components.core.resources | object | `{}` | Setup resource limits and requests for the app |
| components.core.restartPolicy | string | `"Always"` |  |
| components.core.service.ports[0].name | string | `"http"` |  |
| components.core.service.ports[0].port | int | `80` |  |
| components.core.service.ports[0].protocol | string | `"TCP"` |  |
| components.core.service.ports[0].targetPort | int | `80` |  |
| components.core.service.type | string | `"ClusterIP"` |  |
| components.core.test[0].hostkey | string | `"_APP_REDIS_HOST"` |  |
| components.core.test[0].portkey | string | `"_APP_REDIS_PORT"` |  |
| components.core.test[1].hostkey | string | `"_APP_DB_HOST"` |  |
| components.core.test[1].portkey | string | `"_APP_DB_PORT"` |  |
| components.core.tolerations | list | `[]` |  |
| components.executor | string | `nil` |  |
| components.realtime.affinity | object | `{}` |  |
| components.realtime.autoscaling.behavior | object | `{}` |  |
| components.realtime.autoscaling.enabled | bool | `false` |  |
| components.realtime.autoscaling.maxReplicas | int | `5` |  |
| components.realtime.autoscaling.minReplicas | int | `1` |  |
| components.realtime.autoscaling.targetCPU | string | `"60"` |  |
| components.realtime.autoscaling.targetMemory | string | `""` |  |
| components.realtime.command[0] | string | `"realtime"` |  |
| components.realtime.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| components.realtime.containerSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| components.realtime.deploymentStrategy.maxUnavailable | int | `1` |  |
| components.realtime.deploymentStrategy.type | string | `"RollingUpdate"` |  |
| components.realtime.env | bool | `true` |  |
| components.realtime.image.pullPolicy | string | `"IfNotPresent"` |  |
| components.realtime.image.registry | string | `"docker.io"` |  |
| components.realtime.image.repository | string | `"appwrite/console"` |  |
| components.realtime.image.tag | string | `"5.0.12"` |  |
| components.realtime.ingress.annotations | object | `{}` |  |
| components.realtime.ingress.className | string | `""` |  |
| components.realtime.ingress.enabled | bool | `false` |  |
| components.realtime.ingress.rules[0].host | string | `"localhost"` |  |
| components.realtime.ingress.rules[0].http.paths[0].backend.service.name | string | `"appwrite-realtime-svc"` |  |
| components.realtime.ingress.rules[0].http.paths[0].backend.service.port.number | int | `80` |  |
| components.realtime.ingress.rules[0].http.paths[0].path | string | `"/v1/realtime"` |  |
| components.realtime.ingress.rules[0].http.paths[0].pathType | string | `"Prefix"` |  |
| components.realtime.ingress.tls | list | `[]` |  |
| components.realtime.livenessProbe.failureThreshold | int | `10` |  |
| components.realtime.livenessProbe.initialDelaySeconds | int | `30` |  |
| components.realtime.livenessProbe.tcpSocket.port | int | `80` |  |
| components.realtime.livenessProbe.timeoutSeconds | int | `30` |  |
| components.realtime.networkPolicy.egress | object | `{}` |  |
| components.realtime.networkPolicy.enabled | bool | `false` |  |
| components.realtime.networkPolicy.ingress[0].from[0].ipBlock.cidr | string | `"0.0.0.0/0"` |  |
| components.realtime.networkPolicy.ingress[0].from[1].namespaceSelector.matchLabels.namespace | string | `"default"` |  |
| components.realtime.networkPolicy.ingress[0].ports[0].port | int | `80` |  |
| components.realtime.networkPolicy.ingress[0].ports[0].protocol | string | `"TCP"` |  |
| components.realtime.networkPolicy.policyTypes[0] | string | `"Ingress"` |  |
| components.realtime.nodeSelector | object | `{}` |  |
| components.realtime.podAnnotations | object | `{}` |  |
| components.realtime.podDisruption.config | string | `nil` |  |
| components.realtime.podDisruption.enabled | bool | `false` |  |
| components.realtime.podLabels | object | `{}` |  |
| components.realtime.podSecurityContext.fsGroup | int | `0` |  |
| components.realtime.podSecurityContext.fsGroupChangePolicy | string | `"OnRootMismatch"` |  |
| components.realtime.podSecurityContext.runAsGroup | int | `0` |  |
| components.realtime.podSecurityContext.runAsNonRoot | bool | `false` |  |
| components.realtime.podSecurityContext.runAsUser | int | `0` |  |
| components.realtime.ports[0].containerPort | int | `80` |  |
| components.realtime.ports[0].name | string | `"http"` |  |
| components.realtime.ports[0].protocol | string | `"TCP"` |  |
| components.realtime.readinessProbe.tcpSocket.port | int | `80` |  |
| components.realtime.replicaCount | int | `1` |  |
| components.realtime.resources | object | `{}` |  |
| components.realtime.restartPolicy | string | `"Always"` |  |
| components.realtime.service.ports[0].name | string | `"http"` |  |
| components.realtime.service.ports[0].port | int | `80` |  |
| components.realtime.service.ports[0].protocol | string | `"TCP"` |  |
| components.realtime.service.ports[0].targetPort | int | `80` |  |
| components.realtime.service.type | string | `"ClusterIP"` |  |
| components.realtime.test[0].hostkey | string | `"_APP_REDIS_HOST"` |  |
| components.realtime.test[0].portkey | string | `"_APP_REDIS_PORT"` |  |
| components.realtime.test[1].hostkey | string | `"_APP_DB_HOST"` |  |
| components.realtime.test[1].portkey | string | `"_APP_DB_PORT"` |  |
| components.realtime.tolerations | list | `[]` |  |
| environments | object | `{"assistant":{"openAi":{"apiKey":""}},"console":{"whitelist":{"emails":"","ips":"","root":""}},"database":{"host":"","password":"your-secret-password","port":3306,"rootPassword":"root-secret-root-password","schema":"appwrite","username":"user"},"dockerHub":{"password":"","username":""},"domain":{"app":"localhost","functions":"functions.localhost","target":"localhost"},"env":"production","executor":{"host":"","secret":""},"functions":{"buildTimeout":900,"cpus":"","inactiveThreshold":600,"maintenanceInterval":600,"memory":"","runtimes":["php-8.0","node-18.0","python-3.9","ruby-3.1"],"sizeLimit":30000000,"timeout":900},"graphql":{"maxBatchSize":10,"maxComplexity":250,"maxDepth":3},"influxdb":{"host":"","port":8086},"locale":"en","logging":{"config":"","provider":""},"maintenance":{"interval":86400,"retention":{"abuse":86400,"audit":1209600,"cache":2592000,"execution":1209600,"schedules":86400,"usageHourly":8640000}},"migrations":{"firebase":{"clientId":"","clientSecret":""}},"openssl":{"keyV1":""},"options":{"abuse":"disabled","forceHttps":"disabled","functions":{"forceHttps":"disabled"},"routerProtection":"disabled"},"redis":{"host":"","password":"","port":6379,"username":""},"sms":{"from":"","provider":""},"smtp":{"host":"","password":"","port":"","secure":"","username":""},"statsd":{"host":"","port":8125},"storage":{"antivirus":{"enabled":"disabled","host":"clamav","port":3310},"backblaze":{"accessKey":"","bucket":"","region":"us-west-004","secret":""},"device":"Local","doSpaces":{"accessKey":"","bucket":"","region":"us-east-1","secret":""},"limit":30000000,"linode":{"accessKey":"","bucket":"","region":"eu-central-1","secret":""},"previewLimit":20000000,"s3":{"accessKey":"","bucket":"","endpointUrl":"","region":"us-east-1","secret":""},"wasabi":{"accessKey":"","bucket":"","region":"eu-central-1","secret":""}},"system":{"email":{"address":"team@appwrite.io","name":"Appwrite"},"response":{"format":""},"security":{"emailAddress":"security@appwrite.io"}},"usage":{"aggregationInterval":5,"stats":"enabled"},"vcs":{"github":{"appId":"","appName":"","clientId":"","clientSecret":"","privateKey":"disabled","webhookSecret":""}},"worker":{"perCore":6}}` | Environment variables for Appwrite ref: [https://appwrite.io/docs/advanced/self-hosting/environment-variables] (https://appwrite.io/docs/advanced/self-hosting/environment-variables) |
| global | object | `{"imagePullSecrets":[],"storageClass":""}` | These global values also affect the sub-charts |
| global.imagePullSecrets | list | `[]` | Global Docker registry secret names E.g. imagePullSecrets:   - myRegistryKeySecretName |
| global.storageClass | string | `""` | Global StorageClass for Persistent Volume(s) |
| influxdb.auth.admin.bucket | string | `"telegraf"` |  |
| influxdb.auth.admin.org | string | `"appwrite"` |  |
| influxdb.auth.admin.token | string | `"supersecret-influx-token"` |  |
| influxdb.enabled | bool | `false` |  |
| mariadb.enabled | bool | `false` |  |
| podAnnotations | object | `{}` | Common annotations shared across pods |
| podLabels | object | `{}` | Common label shared across pods |
| redis.auth.enabled | bool | `false` |  |
| redis.auth.sentinel | bool | `false` |  |
| redis.enabled | bool | `false` |  |
| telegraf.config.outputs[0].influxdb_v2.bucket | string | `"telegraf"` |  |
| telegraf.config.outputs[0].influxdb_v2.organization | string | `"appwrite"` |  |
| telegraf.config.outputs[0].influxdb_v2.token | string | `"supersecret-influx-token"` |  |
| telegraf.config.outputs[0].influxdb_v2.urls[0] | string | `""` |  |
| telegraf.enabled | bool | `false` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
