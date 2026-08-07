# Stored Procedures

## 📖 Introduction

A Stored Procedure is a collection of SQL statements stored inside the database. It can be executed whenever required.

Stored Procedures reduce repetitive SQL code.

---

## 🎯 Advantages

- Reusable
- Faster execution
- Improved security
- Easier maintenance

---

## PostgreSQL Function Example

```sql
CREATE OR REPLACE FUNCTION get_vehicle_count()

RETURNS INTEGER

AS $$

DECLARE

total INTEGER;

BEGIN

SELECT COUNT(*)

INTO total

FROM Vehicles;

RETURN total;

END;

$$ LANGUAGE plpgsql;
```

---

## Execute

```sql
SELECT get_vehicle_count();
```

---

## 🚗 Automobile Example

Create a stored procedure that returns the total number of vehicles sold.

---

## 💡 Key Takeaways

- Stored Procedures automate repetitive tasks.
- Improve maintainability.
- Execute directly from the database.

---

## 🎤 Interview Questions

1. What is a Stored Procedure?
2. Advantages?
3. Procedure vs Function?

---

## 📝 Summary

Stored Procedures centralize business logic inside the database for better performance and maintainability.