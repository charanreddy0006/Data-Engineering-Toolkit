# State, Checkpointing and Recovery

State allows Flink to remember information between events.

## Why State Is Needed

Consider:

```text
V001 → 60
V001 → 70
V001 → 72
```

To calculate the latest speed or average, Flink needs information from
previous events.

## Keyed State

```text
V001 → State A
V002 → State B
V003 → State C
```

Common state types include:

```text
ValueState
ListState
MapState
ReducingState
AggregatingState
```

## ValueState

Stores one value per key.

```text
V001 → latestSpeed = 72
```

## MapState

Stores key-value pairs.

```text
V001 →
{
  speed: 72,
  fuel: 61
}
```

## State TTL

TTL limits how long state remains active.

```text
Created → Active → Expired → Cleanup
```

TTL is useful when keys may otherwise remain forever.

## Checkpoints

A checkpoint is a consistent snapshot used for recovery.

```text
Flink Job
   |
   +---- Operator State
   +---- Keyed State
   |
   v
Checkpoint Storage
```

If a failure occurs:

```text
Failure
  ↓
Restore Checkpoint
  ↓
Restart
  ↓
Continue Processing
```

## Savepoints

A savepoint is generally triggered intentionally by the user.

Common uses:

- planned upgrades
- migration
- controlled restart
- changing application versions

## Checkpoint vs Savepoint

| Feature | Checkpoint | Savepoint |
|---|---|---|
| Primary purpose | Automatic recovery | Planned operations |
| Trigger | Runtime | User/application workflow |
| Recovery | Automatic | Controlled |
| Migration | Not primary purpose | Common use |

## Exactly-Once

Exactly-once processing requires compatible end-to-end components.

```text
Source
 ↓
Flink
 ↓
State
 ↓
Checkpoint
 ↓
Transactional/Compatible Sink
```

Do not assume an exactly-once engine automatically makes every external
system exactly-once.

## Recovery Design

Consider:

- checkpoint interval
- checkpoint timeout
- storage durability
- state size
- restart strategy
- sink semantics
- external dependencies

## Automobile Example

A vehicle alert job may maintain the latest temperature per vehicle. If the
TaskManager fails, Flink restores the keyed state and continues from a
consistent checkpoint.

## Summary

```text
State = Memory of the application
Checkpoint = Recovery snapshot
Savepoint = Controlled snapshot
```
