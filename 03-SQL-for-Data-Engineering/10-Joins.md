# SQL Joins

## 📖 Introduction

Joins combine data from multiple tables using common columns.

Joins are among the most important SQL concepts for Data Engineers.

---

## Types of Joins

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN
- CROSS JOIN
- SELF JOIN

---

## INNER JOIN

```sql
SELECT *

FROM Orders o

INNER JOIN Customers c

ON o.CustomerID=c.CustomerID;
```

---

## LEFT JOIN

```sql
SELECT *

FROM Customers c

LEFT JOIN Orders o

ON c.CustomerID=o.CustomerID;
```

---

## RIGHT JOIN

```sql
SELECT *

FROM Orders o

RIGHT JOIN Vehicles v

ON o.VehicleID=v.VehicleID;
```

---

## FULL OUTER JOIN

Returns all matching and non-matching rows.

---

## CROSS JOIN

Produces every possible combination.

---

## 🚗 Automobile Example

Generate a report showing:

Customer → Vehicle Purchased → Order Date

---

## 💡 Key Takeaways

- INNER returns matching rows.
- LEFT returns all left rows.
- RIGHT returns all right rows.
- FULL returns everything.

---

## 🎤 Interview Questions

1. Explain INNER JOIN.
2. LEFT vs RIGHT JOIN.
3. What is CROSS JOIN?

---

## 📝 Summary

Joins combine related tables and are essential for relational databases.