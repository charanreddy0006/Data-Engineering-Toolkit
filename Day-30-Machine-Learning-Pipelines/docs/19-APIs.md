# 19. ML APIs

## Example

```http
POST /v1/maintenance-risk
```

Request:

```json
{"vehicle_id":"V1001"}
```

Response:

```json
{
  "vehicle_id": "V1001",
  "risk_score": 0.82,
  "model_version": "maintenance-risk-v12",
  "prediction_time": "2026-09-22T12:00:00Z"
}
```

## Design

Include:
- versioned endpoints
- input validation
- authentication
- request IDs
- structured errors
- timeouts
- logging

## Security

Never use UI hiding as a security boundary. Authorization belongs in the service/data layer.
