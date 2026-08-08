
---

# 📄 14-Cron-Jobs.md

```markdown
# Cron Jobs

## Introduction

Cron is a Linux scheduling mechanism used to automatically execute commands or scripts at specified times.

Data Engineers can use cron for simple scheduled tasks such as:

- Running ETL scripts
- Moving files
- Creating backups
- Processing daily data
- Cleaning temporary files
- Generating reports

For complex production workflows, tools such as Airflow are generally more suitable, but understanding cron remains important.

---

## Check Cron Service

On many Linux distributions:

```bash
systemctl status cron