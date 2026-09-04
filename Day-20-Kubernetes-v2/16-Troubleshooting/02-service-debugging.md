# Service Debugging

If a Service cannot reach the application:

## 1. Service

```bash
kubectl get svc
kubectl describe svc telemetry-api
```

## 2. Pod labels

```bash
kubectl get pods --show-labels
```

Compare them with the Service selector.

## 3. EndpointSlices

```bash
kubectl get endpointslices
```

No endpoints often means the selector does not match or Pods are not ready.

## 4. Port mapping

Check:

```text
Service port
targetPort
containerPort
```

## 5. Test internally

```bash
kubectl run curl-test --rm -it --image=curlimages/curl -- sh
```

Then call the Service DNS name.

## Classic mistake

Inside a Pod:

```text
localhost
```

means that Pod's own network namespace.

It does not mean another Pod.

Use the Service DNS name for another application.
