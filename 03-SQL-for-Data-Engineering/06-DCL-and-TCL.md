# DCL and TCL

## 📖 Introduction

DCL controls database permissions, while TCL manages database transactions.

---

# DCL Commands

| Command | Purpose |
|----------|----------|
| GRANT | Give permissions |
| REVOKE | Remove permissions |

---

## GRANT

```sql
GRANT SELECT

ON Vehicles

TO analyst;
```

---

## REVOKE

```sql
REVOKE SELECT

ON Vehicles

FROM analyst;
```

---

# TCL Commands

| Command | Purpose |
|----------|----------|
| COMMIT | Save changes |
| ROLLBACK | Undo changes |
| SAVEPOINT | Create checkpoint |

---

## COMMIT

```sql
COMMIT;
```

---

## ROLLBACK

```sql
ROLLBACK;
```

---

## SAVEPOINT

```sql
SAVEPOINT before_update;
```

---

## 🚗 Automobile Example

A vehicle price update can be rolled back if incorrect data is entered.

---

## 💡 Key Takeaways

- DCL manages permissions.
- TCL manages transactions.

---

## 🎤 Interview Questions

1. What is DCL?
2. Explain COMMIT.
3. Explain ROLLBACK.

---

## 📝 Summary

DCL secures databases, while TCL ensures transaction reliability.