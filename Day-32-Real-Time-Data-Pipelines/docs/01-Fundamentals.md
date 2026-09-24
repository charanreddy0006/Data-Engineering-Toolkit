# 1. Real-Time Data Pipeline Fundamentals

Real-time processing handles data continuously or with a small delay instead of waiting for a scheduled batch.

## Examples
- vehicle telemetry
- fraud signals
- application logs
- IoT sensors
- live pricing

## Why it exists
Some information loses value when delivered late. A safety alert received tomorrow is not a useful real-time alert.

## Core concepts
**Event:** something that happened.  
**Producer:** creates an event.  
**Broker:** transports and retains events.  
**Processor:** transforms events.  
**Consumer:** uses processed events.

## Mental model
```text
Event → Broker → Processor → Store / Application
```

## Automobile
A vehicle emits a high-severity fault. The stream pipeline validates the event, enriches it with vehicle metadata and sends an alert to operations.
