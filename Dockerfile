FROM  golang:1.26 AS build

WORKDIR /go/src/app
COPY . .

RUN go mod download
RUN go tool builder --config manifest.yaml

FROM gcr.io/distroless/static-debian12

COPY --from=build /go/src/app/build/otel-collector /

CMD ["/otel-collector", "--config",  "/etc/otelcol/config.yaml"]
