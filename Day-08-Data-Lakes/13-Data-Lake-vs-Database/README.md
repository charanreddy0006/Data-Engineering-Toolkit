# 13 — Data Lake vs Database

## Database

Databases are commonly used for operational applications.

Examples:

- PostgreSQL
- MySQL
- SQL Server

They provide structured schemas and transactional capabilities.

## Data Lake

A lake is primarily an analytical storage architecture designed for large
and diverse datasets.

## Comparison

```text
Application
    |
    v
Database
    |
    | CDC
    v
Data Lake
    |
    v
Analytics
```

## Key Difference

A database answers operational questions such as:

```text
Create order
Update customer
Read account
```

A lake supports analytical questions such as:

```text
How did vehicle battery behavior change
across millions of journeys?
```

Both systems are valuable and often appear in the same architecture.
