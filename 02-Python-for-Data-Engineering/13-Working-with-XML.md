# Working with XML

## 📖 Introduction

XML (eXtensible Markup Language) is another popular data exchange format used in enterprise applications, banking systems, and legacy software.

---

## 🎯 Learning Objectives

- Understand XML
- Read XML files
- Parse XML using Python

---

## XML Example

```xml
<vehicle>
    <brand>Tata</brand>
    <model>Nexon EV</model>
</vehicle>
```

---

## Reading XML

```python
import xml.etree.ElementTree as ET

tree = ET.parse("vehicle.xml")

root = tree.getroot()

print(root.tag)
```

---

## Applications

- Banking
- ERP Systems
- SOAP APIs
- Enterprise Software

---

## 🚗 Automobile Example

Vehicle manufacturing systems exchange production reports in XML format.

---

## 💡 Key Takeaways

- XML stores hierarchical data.
- Still widely used in enterprise systems.
- Python provides built-in XML support.

---

## 🎤 Interview Questions

1. What is XML?
2. XML vs JSON?
3. Which Python module parses XML?

---

## 📝 Summary

Although JSON is more popular today, XML remains important in enterprise Data Engineering.