# 34. Reliability Architecture

Design for expected and unexpected failure.

## Techniques
- retries
- idempotency
- checkpoints
- replication
- backups
- replay
- failover

## Questions
What if a source goes down? What if a processor crashes? Can the platform replay data? Can outputs be rebuilt?

## Automobile
Retain events long enough to recover important connected-vehicle streams after temporary processing failures.
