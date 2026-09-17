# BI Performance Plan

## Data Layer
- Use partitioning for large event facts.
- Maintain curated aggregates.
- Avoid loading unnecessary raw telemetry into interactive reports.

## Model Layer
- Prefer star schema.
- Keep relationships simple.
- Define clear grain.
- Avoid unnecessary many-to-many relationships.

## Query Layer
- Push expensive transformations upstream.
- Filter by date and relevant dimensions.
- Inspect query plans.

## Dashboard Layer
- Limit visuals per page.
- Avoid repeated expensive calculations.
- Use summary tables for executive views.

## Target
Define measurable targets such as:
- Executive page load under agreed threshold.
- Critical queries monitored by percentile latency.
- Refresh completion before business start time.
