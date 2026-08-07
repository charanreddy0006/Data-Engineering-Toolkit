# SQL Triggers

## 📖 Introduction

A Trigger is a special database object that automatically executes when a specific event occurs on a table.

Triggers help automate tasks such as auditing, logging, validation, and maintaining data consistency.

---

## 🎯 Learning Objectives

After completing this chapter, you will:

- Understand Triggers
- Create a Trigger
- Learn Trigger Events
- Explore real-world use cases

---

## Trigger Events

- BEFORE INSERT
- AFTER INSERT
- BEFORE UPDATE
- AFTER UPDATE
- BEFORE DELETE
- AFTER DELETE

---

## Trigger Example

```sql
CREATE OR REPLACE FUNCTION log_vehicle_insert()

RETURNS TRIGGER

AS $$

BEGIN

RAISE NOTICE 'New Vehicle Added';

RETURN NEW;

END;

$$ LANGUAGE plpgsql;
```

---

## Create Trigger

```sql
CREATE TRIGGER vehicle_insert_trigger

AFTER INSERT

ON Vehicles

FOR EACH ROW

EXECUTE FUNCTION log_vehicle_insert();
```

---

## 🚗 Automobile Example

Whenever a new vehicle is added, automatically record the event in an audit table.

---

## 💡 Key Takeaways

- Triggers execute automatically.
- Useful for auditing and logging.
- Reduce manual work.

---

## 🎤 Interview Questions

1. What is a Trigger?
2. BEFORE vs AFTER Trigger?
3. When should Triggers be used?

---

## 📝 Summary

Triggers automate database operations and improve data consistency.