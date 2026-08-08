# Linux Users and Groups

## Introduction

Linux supports multiple users. Each user can have different permissions and access levels.

Groups allow administrators to assign permissions to multiple users efficiently.

This becomes particularly useful on shared Data Engineering servers.

---

## Users

Every Linux user has an account.

Check the current user:

```bash
whoami
```

Display user information:

```bash
id
```

Example:

```text
uid=1000(chakri) gid=1000(chakri) groups=1000(chakri)
```

---

## Root User

The `root` user has extensive privileges across the system.

Commands requiring administrative access often use:

```bash
sudo
```

Example:

```bash
sudo apt update
```

Use administrative privileges carefully.

---

## Creating a User

On systems where you have administrative privileges:

```bash
sudo useradd dataengineer
```

Set a password:

```bash
sudo passwd dataengineer
```

A more user-friendly command on Ubuntu is:

```bash
sudo adduser dataengineer
```

---

## Groups

Groups allow users to share permissions.

Create a group:

```bash
sudo groupadd dataengineering
```

Add a user:

```bash
sudo usermod -aG dataengineering dataengineer
```

Check groups:

```bash
groups dataengineer
```

---

## Why Groups Matter

Imagine a Data Engineering team:

```text
Data Engineering Team
│
├── engineer1
├── engineer2
├── analyst1
└── pipeline-service
```

Instead of assigning permissions individually, create:

```text
dataengineering
```

Then assign appropriate directory permissions to the group.

---

## Group-Based Data Directory

Example:

```text
/data/vehicle-pipeline/
├── raw/
├── processed/
└── logs/
```

The directory can belong to:

```text
dataengineering:dataengineering
```

Then team members in the group can access the required files.

---

## Useful Commands

Current user:

```bash
whoami
```

User ID:

```bash
id
```

List users:

```bash
cat /etc/passwd
```

List groups:

```bash
cat /etc/group
```

Check groups:

```bash
groups
```

---

## sudo

`sudo` temporarily provides administrative privileges.

Example:

```bash
sudo mkdir /data
```

Another example:

```bash
sudo systemctl status postgresql
```

---

## Service Accounts

Production data systems often use dedicated service accounts.

For example:

```text
airflow-user
spark-user
kafka-user
pipeline-user
```

A service account can be given only the permissions it requires.

---

## 🚗 Automobile Example

A vehicle company might have:

```text
dataengineering
│
├── ETL Engineers
├── Data Platform Engineers
└── Pipeline Services
```

The group can access:

```text
/data/vehicle-sensor/
```

while other users cannot.

---

## Best Practices

- Avoid using root for normal work.
- Use groups for shared access.
- Give users only required permissions.
- Use service accounts for automated systems.
- Review permissions regularly.

---

## Interview Questions

1. What is a Linux user?
2. What is a Linux group?
3. What does `sudo` do?
4. Why are groups useful?
5. What is a service account?
6. Why should root access be restricted?

---

## Summary

Users and groups provide structured access control.

In Data Engineering environments, they help control access to datasets, pipeline scripts, logs, databases, and cloud infrastructure.