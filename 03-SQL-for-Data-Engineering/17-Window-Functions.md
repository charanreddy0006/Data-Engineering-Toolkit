# Window Functions

## 📖 Introduction

Window Functions perform calculations across a set of rows while preserving individual row details.

Unlike GROUP BY, they do not collapse rows.

---

## Common Window Functions

- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- LEAD()
- LAG()

---

## ROW_NUMBER()

```sql
SELECT

Brand,

Price,

ROW_NUMBER()

OVER(ORDER BY Price DESC)

FROM Vehicles;
```

---

## RANK()

```sql
SELECT

Brand,

Price,

RANK()

OVER(ORDER BY Price DESC)

FROM Vehicles;
```

---

## DENSE_RANK()

```sql
SELECT

Brand,

Price,

DENSE_RANK()

OVER(ORDER BY Price DESC)

FROM Vehicles;
```

---

## 🚗 Automobile Example

Rank vehicles based on selling price.

---

## 💡 Key Takeaways

- Window Functions preserve rows.
- Used for ranking and analytics.
- Frequently asked in interviews.

---

## 🎤 Interview Questions

1. What are Window Functions?
2. Difference between RANK() and DENSE_RANK()?
3. Explain ROW_NUMBER().

---

## 📝 Summary

Window Functions are powerful analytical tools used extensively in Data Engineering.