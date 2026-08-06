# File Handling

## 📖 Introduction

File handling allows Python programs to read, write, and modify files. Data Engineers frequently work with CSV, JSON, log files, and text files while building ETL pipelines.

---

## 🎯 Learning Objectives

After completing this chapter, you will:

- Read text files
- Write data into files
- Append new content
- Use the `with` statement

---

## Opening a File

```python
file = open("sample.txt", "r")
print(file.read())
file.close()
```

---

## Using `with`

```python
with open("sample.txt", "r") as file:
    print(file.read())
```

---

## File Modes

| Mode | Description |
|------|-------------|
| r | Read |
| w | Write |
| a | Append |
| x | Create |
| rb | Read Binary |

---

## Writing to a File

```python
with open("output.txt", "w") as file:
    file.write("Welcome to Data Engineering")
```

---

## 🚗 Automobile Example

A dealership stores daily vehicle sales in a text file. Python reads the file and generates sales reports automatically.

---

## 💡 Key Takeaways

- Always close files.
- Prefer `with` statement.
- Choose the correct file mode.

---

## 🎤 Interview Questions

1. What is file handling?
2. Difference between `w` and `a`?
3. Why use `with open()`?

---

## 📝 Summary

File handling is the foundation of reading and writing datasets in Data Engineering.