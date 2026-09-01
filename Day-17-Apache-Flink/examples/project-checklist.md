# Day 17 Project Checklist

## Infrastructure

- [ ] Start Flink
- [ ] Verify Web UI
- [ ] Start Kafka
- [ ] Create telemetry topic

## Flink

- [ ] Create source
- [ ] Parse JSON
- [ ] Validate records
- [ ] Assign event timestamps
- [ ] Configure watermarks
- [ ] keyBy vehicle_id
- [ ] Add five-minute windows
- [ ] Add state
- [ ] Configure checkpoints

## Business Logic

- [ ] Average speed
- [ ] Maximum speed
- [ ] Temperature alert
- [ ] Overspeed alert
- [ ] Low-fuel alert

## Reliability

- [ ] Test late events
- [ ] Test invalid events
- [ ] Test TaskManager failure
- [ ] Restore from checkpoint
- [ ] Create savepoint

## Operations

- [ ] Monitor Kafka lag
- [ ] Monitor backpressure
- [ ] Monitor checkpoints
- [ ] Monitor CPU and memory
- [ ] Document recovery procedure
