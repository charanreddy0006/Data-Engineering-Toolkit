# Subqueries

## 📖 Introduction

A Subquery is a query written inside another SQL query. It allows you to retrieve data based on the results of another query.

Subqueries improve flexibility and make complex queries easier to write.

---

## 🎯 Learning Objectives

After completing this chapter, you will:

- Understand Subqueries
- Use Single-row and Multi-row Subqueries
- Write Nested Queries

---

## Basic Syntax

```sql
SELECT column_name
FROM table_name
WHERE column_name =
(
    SELECT column_name
    FROM table_name
);
```

---

## Example

Find the most expensive vehicle.

```sql
SELECT *

FROM Vehicles

WHERE Price =

(
    SELECT MAX(Price)

    FROM Vehicles
);
```

---

## IN Subquery

```sql
SELECT *

FROM Customers

WHERE CustomerID IN

(
    SELECT CustomerID

    FROM Orders
);
```

---

## EXISTS

```sql
SELECT *

FROM Customers c

WHERE EXISTS

(
    SELECT *

    FROM Orders o

    WHERE c.CustomerID=o.CustomerID
);
```

---

## 🚗 Automobile Example

Find customers who have purchased at least one vehicle.

---

## 💡 Key Takeaways

- Subqueries simplify complex queries.
- Can return one or multiple values.
- Frequently used in reporting.

---

## 🎤 Interview Questions

1. What is a Subquery?
2. Difference between IN and EXISTS?
3. Where are Subqueries used?

---

## 📝 Summary

Subqueries allow SQL queries to depend on the results of other queries, making them highly flexible.