# Automobile Project Assumptions

1. Telemetry timestamps are UTC.
2. `vehicle_id` identifies a vehicle.
3. Speed cannot be negative.
4. Battery SOC ranges from 0 to 100.
5. PostgreSQL is the learning database.
6. Docker Compose manages local services.
7. Credentials are development-only.
8. CSV is used for beginner-friendly ingestion.
9. Production systems may use APIs, Kafka or other ingestion technologies.
10. The sample loader is intentionally simple.
11. Production ingestion should implement deduplication/idempotency.
12. Production systems require stronger security and observability.
