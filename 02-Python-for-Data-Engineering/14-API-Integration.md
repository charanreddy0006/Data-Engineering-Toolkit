# API Integration

## 📖 Introduction

APIs allow applications to communicate with each other. Data Engineers frequently use APIs to collect data from external systems.

---

## 🎯 Learning Objectives

- Understand APIs
- Make HTTP requests
- Read JSON responses

---

## What is an API?

API stands for **Application Programming Interface**.

It allows one application to request data from another.

---

## Installing Requests

```bash
pip install requests
```

---

## Example

```python
import requests

response = requests.get("https://jsonplaceholder.typicode.com/users")

print(response.status_code)
print(response.json())
```

---

## Common HTTP Methods

- GET
- POST
- PUT
- DELETE

---

## 🚗 Automobile Example

A fleet management API provides:

- Vehicle Location
- Speed
- Fuel Level

Python fetches this data automatically every hour.

---

## 💡 Key Takeaways

- APIs connect applications.
- JSON is the common response format.
- Requests is the most popular library.

---

## 🎤 Interview Questions

1. What is an API?
2. Explain GET and POST.
3. Why are APIs important in Data Engineering?

---

## 📝 Summary

API Integration allows Data Engineers to automate data collection from cloud services and external applications.