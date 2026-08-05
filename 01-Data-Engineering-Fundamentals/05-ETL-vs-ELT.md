# ETL vs ELT

## 📖 Introduction

ETL and ELT are two common approaches used to move and prepare data for analytics. Both involve extracting data from different sources, but they differ in when the transformation takes place.

---

## 🎯 Learning Objectives

After completing this chapter, you will:

- Understand ETL and ELT.
- Compare both approaches.
- Learn where each is used.
- Explore practical examples.

---

## 📌 What is ETL?

**ETL** stands for:

- Extract
- Transform
- Load

The data is transformed **before** loading into the destination.

```text
Source
   │
Extract
   │
Transform
   │
Load
   │
Warehouse
```

---

## 📌 What is ELT?

**ELT** stands for:

- Extract
- Load
- Transform

The data is loaded first and transformed later.

```text
Source
   │
Extract
   │
Load
   │
Warehouse
   │
Transform
```

---

## 📊 Comparison

| Feature | ETL | ELT |
|---------|-----|-----|
| Transformation | Before Loading | After Loading |
| Speed | Moderate | Faster |
| Best For | Traditional Systems | Cloud Platforms |
| Storage | Less Flexible | More Flexible |

---

## 🌍 Real-World Example

A bank cleans customer transaction data before storing it in a warehouse using ETL.

A cloud company loads raw data into Snowflake first and transforms it later using ELT.

---

## 🚗 Automobile Industry Example

Vehicle sensor data is loaded into a Data Lake first and transformed later for analytics. This is a common ELT approach.

---

## 💡 Key Takeaways

- ETL transforms data before loading.
- ELT transforms data after loading.
- Cloud platforms commonly use ELT.

---

## 🎤 Interview Questions

1. What is ETL?
2. What is ELT?
3. Explain the difference between ETL and ELT.
4. Which approach is better for cloud platforms?

---

## 📝 Summary

ETL and ELT are fundamental data integration techniques. Choosing the right approach depends on business requirements, data volume, and the target platform.