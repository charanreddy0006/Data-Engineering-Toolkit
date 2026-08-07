# DML (Data Manipulation Language)

## 📖 Introduction

DML commands are used to insert, update, retrieve, and delete records from database tables.

Unlike DDL, DML works with the data stored inside tables.

---

## DML Commands

| Command | Purpose |
|----------|----------|
| INSERT | Add records |
| SELECT | Retrieve records |
| UPDATE | Modify records |
| DELETE | Remove records |

---

## INSERT

```sql
INSERT INTO Vehicles
VALUES
(1,'Tesla','Model Y','Electric',6200000,2026);
```

---

## SELECT

```sql
SELECT *
FROM Vehicles;
```

---

## UPDATE

```sql
UPDATE Vehicles

SET Price=6400000

WHERE VehicleID=1;
```

---

## DELETE

```sql
DELETE FROM Vehicles

WHERE VehicleID=1;
```

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

- DML works with table data.
- SELECT is the most frequently used SQL command.

---

## 🎤 Interview Questions

1. What is DML?
2. Difference between DELETE and TRUNCATE?
3. Explain UPDATE.

---

## 📝 Summary

DML commands manage the records stored in database tables.