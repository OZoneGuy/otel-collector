# otel-collector Collector

Welcome to your new custom OpenTelemetry Collector!
This Collector allows you to configure the components you wish to use, and only those.

Components can come from the ones provided by the OpenTelemetry organization in
the
[opentelemetry-collector-contrib](https://github.com/open-telemetry/opentelemetry-collector-contrib)
repository, or from any other source, including your [custom, possibly private
code](https://opentelemetry.io/docs/collector/extend/custom-component/). The
only requirement is that they match the Go interface for that component, so the
Collector can run them.

## Overview

This custom OpenTelemetry Collector is designed for collecting and exporting telemetry data from Kubernetes environments. It provides comprehensive observability through multiple receivers and exporters.

### Components

**Receivers:**
- **OTLP** - Receives OTLP protocol data (traces, metrics, logs)
- **Docker Stats** - Collects container metrics from Docker
- **Prometheus** - Scrapes Prometheus metrics endpoints
- **File Log** - Reads logs from files
- **Fluent Forward** - Receives Fluentd/ Fluent Bit logs
- **Host Metrics** - Collects system-level metrics
- **HTTP Check** - Monitors HTTP endpoints
- **K8s Cluster** - Collects Kubernetes cluster-level metrics
- **K8s Events** - Collects Kubernetes events
- **K8s Objects** - Collects Kubernetes objects metrics
- **Kubelet Stats** - Collects kubelet statistics

**Exporters:**
- **OTLP** - Exports data via OTLP protocol (gRPC)
- **OTLP HTTP** - Exports data via OTLP protocol (HTTP)

## Important files

Edit these two files to customize your Collector:

* `manifest.yaml` - The manifest file configures the OpenTelemetry Collector Builder and tells it what modules it needs to enable within your custom collector.
  See [Configure the OpenTelemetry Collector Builder](https://opentelemetry.io/docs/collector/extend/ocb/#configure-the-opentelemetry-collector-builder) for more information.
* `config.yaml` - Used to test the collector.
  See [Collector Configuration](https://opentelemetry.io/docs/collector/configuration/) for more information.

## Building the Collector

### Manually building the Collector

To build the OpenTelemetry Collector binary manually, run:

```
go tool builder --config manifest.yaml
```

This will compile the collector and place the binary in the `build/collector` directory.

### Building the Docker image

To build a Docker image of your custom Collector, run:

```
docker build . -t otel-collector:<version>
```

This will build the Docker image locally. The image tag will follow the pattern `otel-collector:<version>`.

### Pushing the image to a registry

To push the image to your preferred container registry, first tag the image with your registry URL, then push:

```
docker tag otel-collector:<version> <your-registry>/otel-collector:<version>
docker push <your-registry>/otel-collector:<version>
```

Replace `<your-registry>` with your registry hostname (e.g., `ghcr.io`, `docker.io`, `myregistry.io`) and `<version>` with your desired version tag.

## Next

To learn more, read the [Extend the
Collector](https://opentelemetry.io/docs/collector/extend/) documentation,
which will give you pointers to configure your new custom Collector, and to
build custom components.
