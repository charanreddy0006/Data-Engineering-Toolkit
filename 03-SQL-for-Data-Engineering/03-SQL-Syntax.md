# SQL Syntax

## 📖 Introduction

SQL follows a simple and readable syntax. Every SQL statement performs a specific operation on a database.

---

## Basic Query

```sql
SELECT * FROM vehicles;
```

---

## SQL Keywords

- SELECT
- FROM
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- INSERT
- UPDATE
- DELETE

---

## Query Structure

```sql
SELECT column_name
FROM table_name
WHERE condition;
```

---

## Example

```sql
SELECT Brand, Price
FROM Vehicles
WHERE Price > 2000000;
```

---

## SQL Rules

- SQL keywords are case-insensitive.
- End statements with `;`
- Use meaningful table names.
- Format queries for readability.

---

## 🚗 Automobile Example

Retrieve all electric vehicles.

```sql
SELECT *
FROM Vehicles
WHERE FuelType='Electric';
```

---

## 💡 Key Takeaways

- SQL has a simple syntax.
- Every query begins with a command.
- Readable formatting improves maintenance.

---

## 🎤 Interview Questions

1. Explain SQL syntax.
2. Why is SQL case-insensitive?
3. What is the purpose of SELECT?

---

## 📝 Summary

Learning SQL syntax is the first step toward writing efficient database queries.