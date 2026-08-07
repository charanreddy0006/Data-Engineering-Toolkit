# Query Optimization

## 📖 Introduction

Query Optimization improves SQL query performance by reducing execution time and resource usage.

Efficient queries are critical when working with millions of records.

---

## Best Practices

- Select only required columns.
- Avoid SELECT *.
- Use Indexes.
- Filter early with WHERE.
- Avoid unnecessary subqueries.
- Optimize JOIN conditions.
- Analyze execution plans.

---

## Good Example

```sql
SELECT Brand,Price

FROM Vehicles

WHERE Price > 2000000;
```

---

## Poor Example

```sql
SELECT *

FROM Vehicles;
```

---

## 🚗 Automobile Example

Instead of loading every vehicle record, retrieve only electric vehicles sold after 2024.

---

## 💡 Key Takeaways

- Optimized queries reduce execution time.
- Indexes improve performance.
- Avoid unnecessary data retrieval.

---

## 🎤 Interview Questions

1. What is Query Optimization?
2. Why avoid SELECT *?
3. How do Indexes improve performance?

---

## 📝 Summary

Writing optimized SQL queries is an essential skill for every Data Engineer.