# Logging

## 📖 Introduction

Logging records information about a program while it is running. It helps developers debug applications and monitor production systems.

---

## 🎯 Learning Objectives

- Understand logging
- Create log files
- Record errors

---

## Example

```python
import logging

logging.basicConfig(
    filename="app.log",
    level=logging.INFO
)

logging.info("Pipeline Started")

logging.warning("Missing Value Found")

logging.error("Database Connection Failed")
```

---

## Log Levels

| Level | Purpose |
|--------|----------|
| DEBUG | Detailed Information |
| INFO | General Information |
| WARNING | Potential Issues |
| ERROR | Errors |
| CRITICAL | Serious Errors |

---

## 🚗 Automobile Example

A vehicle data pipeline logs failed GPS updates instead of stopping the application.

---

## 💡 Key Takeaways

- Logging improves debugging.
- Production applications always use logs.
- Log files help identify failures.

---

## 🎤 Interview Questions

1. What is logging?
2. Explain log levels.
3. Why use logging instead of print()?

---

## 📝 Summary

Logging is an essential practice for monitoring Data Engineering pipelines and troubleshooting issues.