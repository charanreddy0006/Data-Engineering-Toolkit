# SQL Views

## 📖 Introduction

A View is a virtual table created using a SQL query. It stores the query instead of storing actual data.

Views simplify complex queries and improve security.

---

## 🎯 Benefits

- Reusable queries
- Improved security
- Simplified reporting
- Better readability

---

## Create View

```sql
CREATE VIEW ElectricVehicles AS

SELECT *

FROM Vehicles

WHERE FuelType='Electric';
```

---

## Query View

```sql
SELECT *

FROM ElectricVehicles;
```

---

## Drop View

```sql
DROP VIEW ElectricVehicles;
```

---

## 🚗 Automobile Example

Create a view showing only premium vehicles.

---

## 💡 Key Takeaways

- Views do not store data.
- They simplify reporting.
- Frequently used in BI tools.

---

## 🎤 Interview Questions

1. What is a View?
2. Why use Views?
3. Difference between View and Table?

---

## 📝 Summary

Views provide a secure and reusable way to access frequently used query results.