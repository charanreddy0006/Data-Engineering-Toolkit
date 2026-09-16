# Logs

## Structured Logging

A useful log can contain:

```json
{
  "timestamp": "...",
  "level": "ERROR",
  "service": "telemetry",
  "operation": "publish",
  "correlation_id": "safe-id",
  "outcome": "failed"
}
```

## Levels

- DEBUG — detailed diagnostics
- INFO — normal significant events
- WARN — abnormal but handled
- ERROR — failed operation
- CRITICAL — severe condition

## Centralized Logging

```text
Jobs / APIs / Kafka / Databases
             ↓
       Collectors/Agents
             ↓
        Central Store
             ↓
       Search/Dashboard
             ↓
            Alert
```

Never place passwords, API keys, private keys, or unnecessary sensitive data in logs.
Logs themselves require access control and appropriate retention.
