# Grouping and Aggregation

## 📖 Introduction

Grouping organizes records into categories, while aggregate functions summarize each group.

---

## GROUP BY

```sql
SELECT Brand,

COUNT(*)

FROM Vehicles

GROUP BY Brand;
```

---

## HAVING

```sql
SELECT FuelType,

COUNT(*)

FROM Vehicles

GROUP BY FuelType

HAVING COUNT(*)>1;
```

---

## ORDER BY

```sql
SELECT *

FROM Vehicles

ORDER BY Price DESC;
```

---

## 🚗 Automobile Example

Count vehicles by fuel type.

```sql
SELECT FuelType,

COUNT(*)

FROM Vehicles

GROUP BY FuelType;
```

---

## 💡 Key Takeaways

- GROUP BY creates groups.
- HAVING filters groups.
- ORDER BY sorts records.

---

## 🎤 Interview Questions

1. Difference between WHERE and HAVING?
2. Explain GROUP BY.
3. Why use ORDER BY?

---

## 📝 Summary

Grouping and aggregation help summarize business data for reporting and analytics.