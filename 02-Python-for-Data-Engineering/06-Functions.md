# Functions

## 📖 Introduction

Functions are reusable blocks of code that perform a specific task. They help reduce repetition and make programs easier to maintain.

---

## 🎯 Why Functions?

Functions provide:

- Code Reusability
- Better Organization
- Easy Testing
- Easy Maintenance

---

## Creating a Function

```python
def greet():
    print("Welcome")
```

Calling it:

```python
greet()
```

---

## Function with Parameters

```python
def square(number):
    return number * number

print(square(5))
```

---

## Default Parameters

```python
def greet(name="User"):
    print(name)

greet()
```

---

## 🚗 Automobile Example

```python
def calculate_speed(distance, time):
    return distance / time

print(calculate_speed(180, 2))
```

---

## 💡 Key Takeaways

- Functions avoid duplicate code.
- Parameters pass values.
- return sends output back.

---

## 🎤 Interview Questions

1. What is a function?
2. Difference between parameter and argument?
3. What is return?

---

## 📝 Summary

Functions improve readability and make Python programs modular and reusable.