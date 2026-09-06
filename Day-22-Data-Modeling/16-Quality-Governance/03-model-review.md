# Data Model Review Checklist

## Business
- Is the purpose clear?
- Is grain explicit?
- Are definitions unambiguous?
- Are lifecycle states documented?

## Relational
- Are keys stable?
- Are relationships correct?
- Are cardinalities correct?
- Are constraints sufficient?

## Analytics
- Are measures additive?
- Are dimensions conformed?
- Is history handled?
- Are many-to-many relationships controlled?

## Operations
- Duplicates?
- Late records?
- Deletes?
- Schema evolution?

## Physical
- Index?
- Partition?
- Cluster?
- Retention?

## Governance
- Owner?
- Sensitivity?
- Lineage?
- Quality?
- Access?

A review should produce explicit decisions, not just a diagram.
