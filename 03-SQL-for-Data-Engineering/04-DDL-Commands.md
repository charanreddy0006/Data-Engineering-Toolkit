# DDL (Data Definition Language)

## 📖 Introduction

DDL (Data Definition Language) consists of SQL commands used to define and manage the structure of database objects such as databases, tables, indexes, and schemas.

These commands modify the database structure rather than the data itself.

---

## 🎯 Learning Objectives

After completing this chapter, you will:

- Understand DDL commands
- Create and modify tables
- Delete database objects
- Rename database objects

---

## DDL Commands

| Command | Purpose |
|----------|----------|
| CREATE | Creates database objects |
| ALTER | Modifies existing objects |
| DROP | Deletes objects permanently |
| TRUNCATE | Removes all rows from a table |
| RENAME | Renames database objects |

---

## CREATE TABLE

```sql
CREATE TABLE Employees(
    EmployeeID INT,
    Name VARCHAR(100),
    Salary DECIMAL(10,2)
);
```

---

## ALTER TABLE

```sql
ALTER TABLE Employees
ADD Email VARCHAR(100);
```

---

## DROP TABLE

```sql
DROP TABLE Employees;
```

---

## TRUNCATE TABLE

```sql
TRUNCATE TABLE Employees;
```

---

## RENAME TABLE

```sql
ALTER TABLE Employees
RENAME TO Staff;
```

---

## 🚗 Automobile Example

Create a table to store vehicle information.

```sql
CREATE TABLE Vehicles(
    VehicleID INT,
    Brand VARCHAR(50),
    Model VARCHAR(50)
);
```

---

## 💡 Key Takeaways

- DDL modifies database structure.
- DROP deletes permanently.
- TRUNCATE removes only data.

---

## 🎤 Interview Questions

1. What is DDL?
2. Difference between DROP and TRUNCATE?
3. Explain ALTER.

---

## 📝 Summary

DDL commands are used to define and modify database structures.