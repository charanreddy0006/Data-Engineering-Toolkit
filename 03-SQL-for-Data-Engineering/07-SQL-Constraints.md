# SQL Constraints

## 📖 Introduction

Constraints are rules applied to table columns to maintain data accuracy and integrity.

---

## Common Constraints

| Constraint | Purpose |
|------------|----------|
| PRIMARY KEY | Unique identifier |
| FOREIGN KEY | Relationship between tables |
| UNIQUE | Prevent duplicate values |
| NOT NULL | Value cannot be NULL |
| CHECK | Restrict values |
| DEFAULT | Default value |

---

## Example

```sql
CREATE TABLE Vehicles(

VehicleID INT PRIMARY KEY,

Brand VARCHAR(50) NOT NULL,

Model VARCHAR(50),

FuelType VARCHAR(20),

Price DECIMAL(10,2) CHECK(Price>0)
);
```

---

## FOREIGN KEY

```sql
FOREIGN KEY(CustomerID)

REFERENCES Customers(CustomerID);
```

---

## 🚗 Automobile Example

Every vehicle must have a unique VehicleID and a valid selling price.

---

## 💡 Key Takeaways

- Constraints improve data quality.
- Primary Keys uniquely identify rows.
- Foreign Keys build relationships.

---

## 🎤 Interview Questions

1. What are Constraints?
2. Difference between PRIMARY KEY and UNIQUE?
3. Explain FOREIGN KEY.

---

## 📝 Summary

Constraints ensure that only valid and consistent data is stored.