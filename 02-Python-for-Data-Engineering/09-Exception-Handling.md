# Exception Handling

## 📖 Introduction

Errors can occur while reading files, connecting to databases, or calling APIs. Exception handling allows programs to continue running without crashing.

---

## 🎯 Learning Objectives

- Understand exceptions
- Use try-except blocks
- Handle common errors

---

## Basic Example

```python
try:
    number = int(input("Enter Number: "))
    print(number)
except ValueError:
    print("Invalid Input")
```

---

## Multiple Exceptions

```python
try:
    file = open("data.txt")
except FileNotFoundError:
    print("File Not Found")
```

---

## Finally Block

```python
try:
    print("Processing...")
finally:
    print("Completed")
```

---

## 🚗 Automobile Example

If a vehicle data file is missing, the pipeline should log the error instead of stopping completely.

---

## 💡 Key Takeaways

- Prevents program crashes.
- Improves reliability.
- Essential for production pipelines.

---

## 🎤 Interview Questions

1. What is Exception Handling?
2. Difference between try and finally?
3. Why use exceptions?

---

## 📝 Summary

Exception handling makes Python applications robust and production-ready.