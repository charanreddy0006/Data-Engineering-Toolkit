# Introduction to Databases

## 1. What Is a Database?

A database is an organized collection of data that can be stored, accessed, managed, and modified efficiently.

For example, an automobile company may store:

```text
Vehicles
Customers
Dealers
Sales
Service Records
Sensor Data
```

Instead of maintaining thousands of separate files, the organization can use databases to manage the information systematically.

## 2. Why Do Databases Exist?

Before modern database systems, applications commonly stored information in files.

Example:

```text
customers.csv
vehicles.csv
sales.csv
service.csv
```

As the amount of data increases, file-based systems become difficult to manage.

Common problems include:

- Duplicate data
- Difficult searching
- Concurrent access problems
- Weak security
- Data inconsistency
- Difficult backup
- Poor scalability

Databases were developed to solve these problems.

## 3. Database Management System

A DBMS is software used to create and manage databases.

Examples:

```text
PostgreSQL
MySQL
Oracle Database
Microsoft SQL Server
MongoDB
```

A DBMS provides functionality for:

- Storing data
- Querying data
- Updating data
- Managing users
- Controlling access
- Handling transactions
- Backup and recovery

## 4. Database Architecture

A simple database architecture is:

```text
Application
     |
     v
Database Driver
     |
     v
DBMS
     |
     v
Database
     |
     v
Storage
```

For example:

```text
Python Application
       |
       v
PostgreSQL Driver
       |
       v
PostgreSQL
       |
       v
Vehicle Database
```

## 5. Database Example

Consider a vehicle database:

```text
vehicles

vehicle_id | brand | model | year
-----------|-------|-------|-----
101        | BMW   | X5    | 2025
102        | Audi  | Q5    | 2024
103        | Tesla | Model3| 2025
```

Applications can query this information when required.

## 6. Database Operations

Typical operations include:

### Create

Add new data.

### Read

Retrieve existing data.

### Update

Modify existing data.

### Delete

Remove data.

These operations are commonly called CRUD:

```text
C → Create
R → Read
U → Update
D → Delete
```

## 7. Database Users

Different people interact with databases differently.

```text
Application Developers
        |
Data Engineers
        |
Data Analysts
        |
Database Administrators
        |
Database
```

A Data Engineer may build pipelines that move data between multiple database systems.

## 8. Database in Data Engineering

A typical architecture:

```text
Application
     |
     v
Operational Database
     |
     v
Data Extraction
     |
     v
ETL / ELT
     |
     v
Data Warehouse
     |
     v
BI / Analytics
```

## 9. Automobile Example

A car dealership may maintain:

```text
Customer Database
       |
       +---- Customer Details
       |
       +---- Vehicle Inventory
       |
       +---- Sales
       |
       +---- Payments
       |
       +---- Service History
```

A Data Engineer can extract this information and build analytics pipelines.

## 10. Advantages

Databases provide:

- Structured data management
- Efficient querying
- Access control
- Transactions
- Data integrity
- Backup and recovery
- Concurrent access

## 11. Limitations

Databases also introduce:

- Administration requirements
- Infrastructure costs
- Scaling challenges
- Backup requirements
- Security responsibilities

## Interview Questions

1. What is a database?
2. What is a DBMS?
3. Why are databases used?
4. What is CRUD?
5. What problems exist with file-based storage?
6. How are databases used in Data Engineering?
7. Difference between a database and a DBMS?

## Summary

Databases provide a structured and reliable way to store and manage data and form an essential foundation for Data Engineering systems.