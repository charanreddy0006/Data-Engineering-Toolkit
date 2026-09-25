# 38. Multi-Region Architecture

Use multiple regions when requirements justify it.

## Reasons
- resilience
- latency
- business continuity
- data residency

## Decisions
- active-active vs active-passive
- replication method
- routing
- conflict handling
- recovery testing

## Automobile
A global vehicle platform may collect data near vehicles and process regionally before creating enterprise products.

Data residency requirements must be known before finalizing the topology.
