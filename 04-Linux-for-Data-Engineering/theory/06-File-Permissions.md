# Linux File Permissions

## Introduction

Linux is a multi-user operating system. Multiple users and processes can access files on the same system.

File permissions determine **who can read, modify, or execute a file**.

Permissions are extremely important in Data Engineering because production pipelines often process sensitive datasets, credentials, configuration files, and logs.

---

## Why Permissions Matter

Consider a production server:

```text
Data Engineering Server
│
├── raw-data/
├── processed-data/
├── logs/
├── configuration/
└── credentials/
```

Not every user should have access to every directory.

For example:

- Analysts may read processed data.
- Engineers may modify pipeline files.
- Applications may write logs.
- Credentials should be restricted.

Linux permissions provide this control.

---

## Checking Permissions

Use:

```bash
ls -l
```

Example:

```text
-rw-r--r-- 1 user user 2450 vehicle.csv
```

The first section represents permissions:

```text
-rw-r--r--
```

---

## Permission Structure

Linux permissions are divided into three groups:

```text
-rw-r--r--
 │ │  │  │
 │ │  │  └── Others
 │ │  └───── Group
 │ └──────── Owner
 └────────── File type
```

Each group can have:

```text
r = read
w = write
x = execute
```

---

## Permission Values

Permissions can also be represented numerically:

| Permission | Value |
|---|---:|
| Read | 4 |
| Write | 2 |
| Execute | 1 |

Therefore:

```text
rwx = 4 + 2 + 1 = 7
rw- = 4 + 2 = 6
r-- = 4
```

---

## chmod

`chmod` changes file permissions.

Example:

```bash
chmod 755 pipeline.sh
```

This means:

```text
Owner  → read + write + execute
Group  → read + execute
Others → read + execute
```

Another example:

```bash
chmod 644 vehicle.csv
```

This gives:

```text
Owner  → read + write
Group  → read
Others → read
```

---

## Making a Script Executable

A Bash script may initially not have execute permission.

Use:

```bash
chmod +x pipeline.sh
```

Then execute:

```bash
./pipeline.sh
```

---

## chown

`chown` changes the owner of a file.

```bash
sudo chown dataengineer vehicle.csv
```

Owner and group can also be changed:

```bash
sudo chown dataengineer:dataengineering vehicle.csv
```

---

## Data Engineering Example

Suppose a pipeline contains:

```text
pipeline/
├── pipeline.sh
├── raw/
├── processed/
└── logs/
```

The pipeline script may need execute permission:

```bash
chmod 750 pipeline.sh
```

But raw data might only need read/write access:

```bash
chmod 640 raw/vehicle_data.csv
```

---

## Security Considerations

Avoid permissions such as:

```bash
chmod 777 file
```

`777` gives everyone read, write, and execute access.

This is usually a poor security practice.

Use the minimum permissions required.

---

## Best Practices

- Follow least privilege.
- Avoid unnecessary `777`.
- Protect credentials.
- Restrict production datasets.
- Make scripts executable only when necessary.
- Understand ownership before changing permissions.

---

## Interview Questions

1. What are Linux file permissions?
2. What do `r`, `w`, and `x` represent?
3. What does `chmod 755` mean?
4. What does `chmod 644` mean?
5. What is `chown`?
6. Why should `chmod 777` generally be avoided?
7. How do you make a shell script executable?

---

## Summary

Linux permissions provide an important security layer for files and directories.

Data Engineers need to understand permissions when working with production servers, ETL scripts, datasets, logs, and credentials.