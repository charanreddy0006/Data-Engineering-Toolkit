# 21. Delivery Guarantees

## At-most-once
May lose events, no repeated processing by the intended mechanism.

## At-least-once
Retries reduce loss risk but duplicates can occur.

## Exactly-once
A processing system can provide exactly-once semantics within defined boundaries; true end-to-end correctness still depends on the sink and external side effects.

## Automobile
For safety telemetry, choose semantics from the consequences of loss and duplication.

Do not treat a single configuration switch as proof of end-to-end exactly-once business outcomes.
