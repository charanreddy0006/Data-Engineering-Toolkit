# Incident Response

## Lifecycle

```text
Detect → Triage → Scope → Diagnose → Mitigate
     → Validate → Communicate → Learn
```

## First Questions

1. What broke?
2. When did it start?
3. What is affected?
4. Is data missing, wrong, or late?
5. What changed recently?
6. Which downstream products are affected?
7. Is there an immediate safe mitigation?

## Runbooks

A runbook should contain symptoms, impact, checks, dashboards, queries/commands,
mitigation, escalation, and recovery validation.

## Postmortem

Include:
- summary
- impact
- timeline
- detection
- root/contributing causes
- response
- corrective actions
- owners and due dates

The purpose is system improvement, not blame.

## MTTD / MTTR

MTTD measures time to detect according to the organization's definition.
MTTR should have an explicitly agreed definition such as time to restore service.
