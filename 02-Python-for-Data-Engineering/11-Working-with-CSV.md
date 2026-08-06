# Working with CSV Files

## 📖 Introduction

CSV (Comma-Separated Values) is one of the most commonly used file formats in Data Engineering. Many ETL pipelines begin by reading CSV files.

---

## 🎯 Learning Objectives

- Read CSV files
- Write CSV files
- Process structured data

---

## Reading CSV

```python
import csv

with open("vehicles.csv") as file:
    reader = csv.reader(file)

    for row in reader:
        print(row)
```

---

## Writing CSV

```python
import csv

with open("output.csv", "w", newline="") as file:

    writer = csv.writer(file)

    writer.writerow(["Brand","Price"])
    writer.writerow(["Tesla",4500000])
```

---

## 🚗 Automobile Example

Read daily vehicle sales data from a CSV file and store it in a database.

---

## 💡 Key Takeaways

- CSV is simple and widely used.
- Python's csv module makes processing easy.
- Common in ETL pipelines.

---

## 🎤 Interview Questions

1. What is CSV?
2. Why is CSV popular?
3. Which module is used?

---

## 📝 Summary

CSV files are one of the most frequently used data sources in Data Engineering.