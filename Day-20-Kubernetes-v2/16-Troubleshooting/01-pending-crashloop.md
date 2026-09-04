# Troubleshooting Pending and CrashLoopBackOff

## Pending

Run:

```bash
kubectl describe pod <pod>
```

Inspect Events.

Common causes:

- insufficient resources,
- node selector mismatch,
- taint/toleration mismatch,
- affinity constraints,
- PVC pending.

## CrashLoopBackOff

Run:

```bash
kubectl logs <pod>
kubectl logs <pod> --previous
kubectl describe pod <pod>
```

Common causes:

- application exception,
- wrong command,
- missing file,
- bad environment variable,
- dependency failure,
- permission problem,
- health probe failure.

## Debugging model

```text
Observe
  ↓
Describe
  ↓
Read Events
  ↓
Read logs
  ↓
Form hypothesis
  ↓
Make one targeted change
  ↓
Verify
```

Avoid changing many unrelated settings at once.
