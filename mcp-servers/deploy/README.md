# socrata-mcp Cloud Run deployment

Terraform config that deploys the `socrata-mcp-server` container to Cloud Run
in `us-central1`.

## ⚠️ Public and unauthenticated — demo use only

This service is deployed with `invoker_iam_disabled = true` and
`ingress = "INGRESS_TRAFFIC_ALL"` (see `main.tf`), meaning **anyone with the
URL can call it — there is no IAM check, no auth, no rate limiting at the
Cloud Run layer.**

This is intentional but only acceptable for **short-lived demos**:

- Stand it up right before a demo.
- Tear it down (or otherwise make it unreachable) right after.
- Do not leave it running unattended.

**Do not treat this as a long-term deployment posture.** Long-term/production
use requires one of:

- The calling client authenticating with `gcloud auth` / IAM identity tokens
  (i.e. flip `invoker_iam_disabled` back to `false` and grant
  `roles/run.invoker` to specific callers), or
- Fronting the service with an MCP gateway that owns auth and rate limiting,
  with Cloud Run restricted to only accept traffic from that gateway.

Neither of those is wired up yet, so until one of them exists, treat every
deployment of this config as temporary.

## Usage

Env vars (`GOOGLE_PROJECT`, `STATE_BUCKET`) are loaded automatically via
`mise` from `deploy.env`.

Turn on for a demo:

```bash
terraform init -backend-config="bucket=$STATE_BUCKET"
terraform apply
```

Turn off after the demo:

```bash
terraform destroy
```

`terraform output urls` prints the service URL while it's live.
