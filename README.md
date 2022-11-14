# Datadog tracing opcache reproduction

This repo serves to reproduce a bug in the Datadog PHP tracer that causes
Laravel applications with autoloader-based preloading to segfault on execution.

## Running this reproduction

```sh
git clone https://github.com/phroggyy/dd-trace-preload-segfault-repro.git
cd dd-trace-preload-segfault-repro
docker build --platform=linux/amd64 -t dd-trace-preload-segfault-repro .
docker run --rm --platform=linux/amd64 -e "DD_TRACE_ENABLED=1" -e "DD_TRACE_DEBUG=1" -e "DD_AGENT_HOST=host.docker.internal" dd-trace-preload-segfault-repro
```

Replace the `DD_AGENT_HOST` with whatever host is applicable in your case.
