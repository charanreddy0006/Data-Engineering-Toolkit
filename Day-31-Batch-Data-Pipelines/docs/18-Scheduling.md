# 18. Scheduling

Common schedules:
- hourly
- daily
- weekly
- monthly
- dependency-triggered

## Example

```text
02:00 Extract
02:20 Validate
02:40 Transform
03:10 Reconcile
03:20 Publish
```

## Planning questions

- What is the SLA?
- How long can the job run?
- Can jobs overlap?
- What happens after a missed run?
- Can historical runs be caught up?

## Automobile

A dealer dashboard may require all daily pipelines to complete before the morning business window.
