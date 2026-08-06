# Working with JSON

## 📖 Introduction

JSON (JavaScript Object Notation) is one of the most widely used formats for data exchange. APIs, cloud services, and modern applications commonly send and receive data in JSON format.

---

## 🎯 Learning Objectives

After completing this chapter, you will:

- Understand JSON
- Read JSON files
- Write JSON files
- Convert Python objects to JSON

---

## What is JSON?

JSON stores data as **key-value pairs**.

Example:

```json
{
    "brand": "Tesla",
    "model": "Model Y",
    "price": 6200000
}
```

---

## Reading JSON

```python
import json

with open("vehicle.json") as file:
    data = json.load(file)

print(data)
```

---

## Writing JSON

```python
import json

vehicle = {
    "brand": "Tesla",
    "model": "Model Y"
}

with open("vehicle.json","w") as file:
    json.dump(vehicle,file,indent=4)
```

---

## 🚗 Automobile Example

Vehicle details received from an API are stored as JSON before loading into a database.

---

## 💡 Key Takeaways

- JSON is lightweight.
- Easy to read and write.
- Commonly used in APIs.

---

## 🎤 Interview Questions

1. What is JSON?
2. Difference between JSON and CSV?
3. Which module handles JSON?

---

## 📝 Summary

JSON is one of the most important data formats used in Data Engineering.