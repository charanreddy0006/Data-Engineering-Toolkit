# SQL Functions

## 📖 Introduction

SQL Functions perform calculations and manipulate data without modifying the original records.

---

## 🎯 Categories

- Aggregate Functions
- String Functions
- Numeric Functions
- Date Functions

---

# Aggregate Functions

## COUNT

```sql
SELECT COUNT(*)
FROM Vehicles;
```

---

## SUM

```sql
SELECT SUM(Price)
FROM Vehicles;
```

---

## AVG

```sql
SELECT AVG(Price)
FROM Vehicles;
```

---

## MAX

```sql
SELECT MAX(Price)
FROM Vehicles;
```

---

## MIN

```sql
SELECT MIN(Price)
FROM Vehicles;
```

---

# String Functions

```sql
SELECT UPPER(Brand)
FROM Vehicles;
```

```sql
SELECT LOWER(Brand)
FROM Vehicles;
```

```sql
SELECT LENGTH(Brand)
FROM Vehicles;
```

---

# Numeric Functions

```sql
SELECT ROUND(Price);
```

---

## 🚗 Automobile Example

Find the average vehicle price.

```sql
SELECT AVG(Price)
FROM Vehicles;
```

---

## 💡 Key Takeaways

- Aggregate functions summarize data.
- String functions manipulate text.
- Numeric functions perform calculations.

---

## 🎤 Interview Questions

1. Difference between COUNT(*) and COUNT(column)?
2. Explain AVG().
3. Name string functions.

---

## 📝 Summary

Functions simplify calculations and improve query efficiency.