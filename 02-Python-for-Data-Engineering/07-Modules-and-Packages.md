# Modules and Packages

## 📖 Introduction

As Python programs grow, organizing code becomes important. Modules and packages help split large applications into smaller, manageable components.

---

## 🎯 What is a Module?

A module is a Python file containing functions, variables, or classes.

Example:

```python
math.py
```

Import:

```python
import math

print(math.sqrt(25))
```

---

## What is a Package?

A package is a collection of related modules.

Example:

```text
project/

utils/

__init__.py

math_utils.py

file_utils.py
```

---

## Popular Modules

- math
- random
- datetime
- os
- json

---

## Installing External Packages

```bash
pip install requests
```

Example:

```python
import requests
```

---

## 🚗 Automobile Example

A project can have separate modules for:

- Vehicle Data
- GPS Tracking
- Fuel Analytics
- Maintenance Reports

This makes the code organized and maintainable.

---

## 💡 Key Takeaways

- Modules organize code.
- Packages group related modules.
- pip installs external packages.

---

## 🎤 Interview Questions

1. What is a module?
2. What is a package?
3. Difference between built-in and external modules?

---

## 📝 Summary

Modules and packages help developers build scalable, maintainable, and reusable Python applications.