# Virtual Environments

## 📖 Introduction

A Virtual Environment is an isolated Python environment that allows each project to have its own dependencies without affecting other projects.

---

## 🎯 Why Use Virtual Environments?

- Avoid package conflicts
- Keep projects independent
- Easier collaboration
- Better dependency management

---

## Create a Virtual Environment

```bash
python -m venv venv
```

---

## Activate

### Windows

```bash
venv\Scripts\activate
```

### Linux/macOS

```bash
source venv/bin/activate
```

---

## Install Packages

```bash
pip install pandas
pip install requests
```

---

## Save Dependencies

```bash
pip freeze > requirements.txt
```

---

## Install from requirements.txt

```bash
pip install -r requirements.txt
```

---

## 🚗 Automobile Example

Each vehicle analytics project uses its own virtual environment to manage dependencies independently.

---

## 💡 Key Takeaways

- Isolates project dependencies.
- Prevents version conflicts.
- Essential for professional development.

---

## 📝 Summary

Every Python Data Engineering project should use a virtual environment.