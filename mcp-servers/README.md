# MCP servers

Container and OpenShift deployment definitions for MCP servers used for the workshop.

## Included servers

| Server | Upstream project | Release | Container port | Route |
| --- | --- | ---: | ---: | --- |
| `flint-mcp` | [microsoft/flint-chart](https://github.com/microsoft/flint-chart) | `0.5.1` | `8080` | `https://flint-mcp.apps.cloud.rt.nyu.edu` |
| `socrata-mcp` | [npstorey/socrata-mcp-server](https://github.com/npstorey/socrata-mcp-server) | `v0.9.0` | `8000` | `https://socrata-mcp.apps.cloud.rt.nyu.edu` |

Each service is built from its upstream repository at the pinned release in
its `Containerfile`. The GitHub Actions workflows
[`publish-flint-mcp.yaml`](../.github/workflows/publish-flint-mcp.yaml) and
[`publish-mcp-servers.yaml`](../.github/workflows/publish-mcp-servers.yaml)
build and publish the images to:

```text
ghcr.io/nyu-rts/flint-mcp
ghcr.io/nyu-rts/socrata-mcp-server
```

## Deploy to OpenShift

Each server has a self-contained Kustomize overlay. Set `MCP_NAMESPACE` to the
OpenShift namespace before deploying; the manifests intentionally do not
hardcode a namespace.

```sh
oc apply -k flint-mcp/deploy --namespace "$MCP_NAMESPACE"
oc apply -k socrata-mcp/deploy --namespace "$MCP_NAMESPACE"
```

The manifests create a Pod, Service, TLS-terminating Route, and NetworkPolicy
for each server. The NetworkPolicy permits ingress from any namespace in the
cluster. The Routes redirect plain HTTP to HTTPS using the cluster's default
wildcard certificate.

Check rollout and service status with:

```sh
oc get pod,service,route -l app=flint-mcp-server
oc get pod,service,route -l app=socrata-mcp-server
```

## Directory layout

```text
flint-mcp/
  Containerfile
  deploy/       # Kustomize resources for the Flint MCP server
socrata-mcp/
  Containerfile
  deploy/       # Kustomize resources for the Socrata MCP server
```
