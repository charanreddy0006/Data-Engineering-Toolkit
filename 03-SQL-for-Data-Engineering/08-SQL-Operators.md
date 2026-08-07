# SQL Operators

## 📖 Introduction

SQL operators are used to filter, compare, and manipulate data in queries. They help retrieve exactly the data required from a database.

---

## 🎯 Learning Objectives

After completing this chapter, you will:

- Understand SQL operators
- Filter records efficiently
- Use logical conditions
- Combine multiple conditions

---

# Types of Operators

| Operator Type | Examples |
|--------------|----------|
| Arithmetic | + - * / % |
| Comparison | = > < >= <= <> |
| Logical | AND OR NOT |
| Special | BETWEEN IN LIKE IS NULL |

---

## Comparison Operators

```sql
SELECT *
FROM Vehicles
WHERE Price > 2000000;
```

---

## Logical Operators

### AND

```sql
SELECT *
FROM Vehicles
WHERE FuelType='Electric'
AND Price > 2000000;
```

### OR

```sql
SELECT *
FROM Vehicles
WHERE Brand='Tesla'
OR Brand='BMW';
```

### NOT

```sql
SELECT *
FROM Vehicles
WHERE NOT FuelType='Diesel';
```

---

## BETWEEN

```sql
SELECT *
FROM Vehicles
WHERE Price BETWEEN 1500000 AND 3000000;
```

---

## IN

```sql
SELECT *
FROM Vehicles
WHERE Brand IN ('Tesla','BMW','Audi');
```

---

## LIKE

```sql
SELECT *
FROM Customers
WHERE CustomerName LIKE 'R%';
```

---

## IS NULL

```sql
SELECT *
FROM Customers
WHERE Phone IS NULL;
```

---

## 🚗 Automobile Example

Retrieve all electric vehicles priced above ₹20 Lakhs.

---

## 💡 Key Takeaways

- Operators filter data.
- LIKE searches patterns.
- BETWEEN checks ranges.
- IN checks multiple values.

---

## 🎤 Interview Questions

1. Explain LIKE.
2. Difference between IN and BETWEEN.
3. What is IS NULL?

---

## 📝 Summary

Operators make SQL queries more powerful and flexible.