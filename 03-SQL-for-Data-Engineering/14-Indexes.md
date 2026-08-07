# SQL Indexes

## 📖 Introduction

Indexes improve the speed of SQL queries by allowing the database to locate records quickly.

Without indexes, databases perform full table scans.

---

## 🎯 Benefits

- Faster searches
- Improved query performance
- Better reporting

---

## Create Index

```sql
CREATE INDEX idx_brand

ON Vehicles(Brand);
```

---

## Drop Index

```sql
DROP INDEX idx_brand;
```

---

## When to Use

- Large tables
- Frequently searched columns
- Join columns

---

## 🚗 Automobile Example

Create an index on VehicleID and Brand to speed up vehicle searches.

---

## 💡 Key Takeaways

- Indexes improve performance.
- Too many indexes slow INSERT and UPDATE.
- Use indexes wisely.

---

## 🎤 Interview Questions

1. What is an Index?
2. Advantages of Indexes?
3. Disadvantages of Indexes?

---

## 📝 Summary

Indexes make SQL queries faster and are essential for large production databases.