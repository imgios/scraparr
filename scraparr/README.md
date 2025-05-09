![Version: 1.2.4](https://img.shields.io/badge/Version-1.2.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.2.1](https://img.shields.io/badge/AppVersion-2.2.1-informational?style=flat-square) 

# scraparr



Scraparr is a Prometheus Exporter for various components of the *arr Suite

**Homepage:** <https://github.com/imgios/scraparr>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Giosuè Sulipano |  | <https://giosuesulipano.it/> |

## Source Code

* <https://github.com/imgios/scraparr>
* <https://github.com/thecfu/scraparr>

> [!NOTE]  
> This Helm Chart is based on the [Scraparr project by thecfu](https://github.com/thecfu/scraparr). If you are looking for details on how scraparr works, see the owner project repository.



## Values

### Scraparr Configuration

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| config | string | By default, there's the basic authentication configured. | This is the configuration in YAML required by Scraparr. See [thecfu's scraparr repository](https://github.com/thecfu/scraparr) for more info. |
| config.auth.password | string | `s3cr3t1Gu3ss` | Insert the Scraparr password to be configured if opt for the basic authentication. |
| config.auth.username | string | `scraparr` | Insert the Scraparr username to be configured if opt for the basic authentication. |
| config.bazarr | list | `{}` | This is the bazarr instances list. You have to define URL, API KEY and alias for each entry. The alias is mandatory if configuring more than one bazarr instance. See [thecfu's scraparr repository](https://github.com/thecfu/scraparr) for more info. |
| config.jellyfin | list | `{}` | This is the jellyfin instances list. You have to define URL, API KEY and alias for each entry. The alias is mandatory if configuring more than one jellyfin instance. See [thecfu's scraparr repository](https://github.com/thecfu/scraparr) for more info. |
| config.jellyseerr | list | `{}` | This is the jellyseerr instances list. You have to define URL, API KEY and alias for each entry. The alias is mandatory if configuring more than one jellyseerr instance. See [thecfu's scraparr repository](https://github.com/thecfu/scraparr) for more info. |
| config.overseerr | list | `{}` | This is the overseerr instances list. You have to define URL, API KEY and alias for each entry. The alias is mandatory if configuring more than one overseerr instance. See [thecfu's scraparr repository](https://github.com/thecfu/scraparr) for more info. |
| config.prowlarr | list | `{}` | This is the prowlarr instances list. You have to define URL, API KEY and alias for each entry. The alias is mandatory if configuring more than one prowlarr instance. See [thecfu's scraparr repository](https://github.com/thecfu/scraparr) for more info. |
| config.radarr | list | `{}` | This is the radarr instances list. You have to define URL, API KEY and alias for each entry. The alias is mandatory if configuring more than one radarr instance. See [thecfu's scraparr repository](https://github.com/thecfu/scraparr) for more info. |
| config.readarr | list | `{}` | This is the readarr instances list. You have to define URL, API KEY and alias for each entry. The alias is mandatory if configuring more than one readarr instance. See [thecfu's scraparr repository](https://github.com/thecfu/scraparr) for more info. |
| config.sonarr | list | `{}` | This is the sonarr instances list. You have to define URL, API KEY and alias for each entry. The alias is mandatory if configuring more than one sonarr instance. See [thecfu's scraparr repository](https://github.com/thecfu/scraparr) for more info. |
| config.whisparr | list | `{}` | This is the whisparr instances list. You have to define URL, API KEY and alias for each entry. The alias is mandatory if configuring more than one whisparr instance. See [thecfu's scraparr repository](https://github.com/thecfu/scraparr) for more info. |

### Chart Configuration

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.pullPolicy | string | `IfNotPresent` | Scraparr container image pull policy. |
| image.repository | string | `ghcr.io/thecfu/scraparr` | Scraparr container repository to fetch the image. |
| image.tag | string | Not set in the values, fetched from the Chart.yaml appVersion parameter. | Scraparr container image tag. This parameter overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | string | `[]` | Define the pull secret to be used when fetching the container image. Useful if `image.repository` is using a private registry. |
| ingress.annotations | string | `{}` | Ingress annotations, e.g., "kubernetes.io/ingress.class: nginx" |
| ingress.className | string | `""` | Ingress class name, e.g., "nginx" |
| ingress.enabled | string | `false` | Enable scraparr ingress to reach it out via FQDN. This may be necessary in some circumstances. |
| ingress.hosts | list | `{"host": "scraparr.metrics.local","paths": [{"path": "/","pathType": "ImplementationSpecific"}]}` | Ingress host(s) to be configured. |
| ingress.tls | string | `[]` | Ingress certificates for secure protocols (e.g., HTTPS) |
| nodeSelector | string | `{}` | This parameter is useful to deploy Scraparr only on a given set of nodes. |
| replicaCount | string | `1` | This is the number of Scraparr deployment replicas. |


----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)