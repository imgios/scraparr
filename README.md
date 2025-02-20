<p>
  <img alt="GitHub Release" src="https://img.shields.io/github/v/release/imgios/scraparr">
  <img alt="GitHub License" src="https://img.shields.io/github/license/imgios/scraparr">
  <a href="https://github.com/imgios/scraparr/issues"><img alt="GitHub Issues" src="https://img.shields.io/github/issues/imgios/scraparr"></a>
</p>

# Scraparr

Unofficial Helm Chart to deploy [thecfu/scraparr](https://github.com/thecfu/scraparr) app on Kubernetes.

> Scraparr is a Prometheus exporter for the *arr suite (Sonarr, Radarr, Lidarr, etc.). It provides metrics that can be scraped by Prometheus to monitor and visualize the health and performance of your *arr applications.
>
> — [thecfu/scraparr](https://github.com/thecfu/scraparr)

## Deployment

The installation is made easy with the GitHub repository also as Helm repository:

1. Add this repository as Helm repository: `helm repo add imgios https://imgios.github.io/scraparr`
2. Install the latest release:

```shell
$ helm install <release-name> imgios/scraparr \
--namespace scraparr \
--create-namespace \
--values values.yaml
```

<sup>Note: if you want to deploy a specific version, execute the previous command adding: <code>--version x.y.z</code></sup>

> [!NOTE]  
> Please read [Helm Chart README.md](https://github.com/imgios/scraparr/blob/main/scraparr/README.md) for details on how to configure the values needed for this chart.

🚀 You're ready to use it!

Check out [thecfu/scraparr](https://github.com/thecfu/scraparr/tree/main/dashboards) for sample Grafana dashboards.

## Contributing

Any contributions you make are **greatly appreciated**. Please, read [CONTRIBUTING.md](https://github.com/imgios/scraparr/blob/main/CONTRIBUTING.md) for details on the code of conduct, and the process for submitting pull requests.

###### 👥 People behind this repository

See the list of [contributors](https://github.com/imgios/scraparr/contributors) who participated in this project.

## Versioning

[SemVer](http://semver.org/) is used for versioning. For the versions available, see the [tags on this repository](https://github.com/imgios/scraparr/tags).

## License

This project is licensed under the GPL-3.0 - see the [LICENSE](LICENSE) file for details

## Acknowledgments

- [🐛 thecfu's Scraparr Project](https://github.com/thecfu/scraparr)
