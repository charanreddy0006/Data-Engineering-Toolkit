# 9. Time Intelligence

Time intelligence compares metrics across periods.

Common calculations:
- Today
- Yesterday
- Week-to-date
- Month-to-date
- Quarter-to-date
- Year-to-date
- Previous month
- Previous year
- Year-over-year growth
- Rolling 7/30/90 days

## Date Dimension
A BI model should usually have a dedicated date dimension.

Typical columns:
```text
date_key
calendar_date
year
quarter
month
month_name
week
day_of_week
is_weekend
```

## YoY Formula
```text
YoY Growth % =
(Current Period - Previous Period)
÷ Previous Period × 100
```

## Automobile Example
Compare monthly service revenue against the same month last year.

## Important
Do not rely only on timestamps in fact tables for every time calculation. A well-designed date dimension makes filtering and period logic easier.
