# Kubernetes Interview — Intermediate

## Deployment vs Pod

A Pod is the workload unit. A Deployment manages replicated Pods and their rollout.

## Deployment vs StatefulSet

Deployment is commonly used for stateless applications. StatefulSet is used when stable identity/storage semantics matter.

## Service vs Pod IP

Pod IPs are ephemeral. Services provide stable discovery and routing.

## Readiness vs Liveness

Readiness controls traffic eligibility. Liveness determines whether the container should be restarted.

## Requests vs Limits

Requests influence scheduling. Limits constrain resource use according to Kubernetes/runtime behavior.

## HPA

HPA changes replica count based on metrics.

## ConfigMap vs Secret

ConfigMap is for non-sensitive configuration. Secret is intended for sensitive data.

## Why Jobs for ETL?

ETL can be run-to-completion, making Job semantics natural.

## Why CronJobs?

They create Jobs according to a schedule.

## Why idempotency?

Retries can execute a batch more than once. Idempotent writes prevent duplicate or inconsistent output.
