# Example Feature Documentation

## Feature
`days_since_last_service`

### Definition
Number of complete calendar days between the latest eligible completed service event and the feature timestamp.

### Entity
Vehicle.

### Source
Service order system.

### Null Handling
Vehicles with no eligible service history receive a documented sentinel or null according to model requirements.

### Freshness
Daily.

### Owner
Service Analytics Team.

### Consumers
Predictive maintenance models.

### Risk
Incorrect service status or time-zone handling can create misleading values.

### Test
A feature value must never be negative.
