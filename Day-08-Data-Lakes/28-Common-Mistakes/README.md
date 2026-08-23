# 28 — Common Data Lake Mistakes

## 1. Treating the Lake as a Dumping Ground

Files without metadata become difficult to understand.

## 2. Using CSV Everywhere

CSV is simple but often inefficient for large analytics.

## 3. Poor Partitioning

Too many partitions can be as problematic as too few.

## 4. Ignoring Small Files

Streaming workloads can create many tiny objects.

## 5. No Data Quality

Bad source records can propagate into every downstream dataset.

## 6. No Ownership

Nobody knows who should fix a broken dataset.

## 7. Weak Security

Broad permissions can expose sensitive data.

## 8. No Monitoring

A pipeline can silently stop producing data.

## 9. No Recovery Plan

Production systems must support retries, replay, and recovery.

## 10. No Cost Controls

Uncontrolled storage and compute can become expensive.

## Main Lesson

A successful lake combines storage with engineering discipline.
