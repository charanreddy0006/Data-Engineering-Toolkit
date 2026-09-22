# Online Serving

## Endpoint

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
  "risk_band": "HIGH",
  "model_version": "maintenance-risk-v1",
  "prediction_time": "2026-09-22T12:00:00Z"
}
```

## Requirements
- authentication
- low latency
- feature freshness
- timeout handling
- structured logs
- model version visibility
