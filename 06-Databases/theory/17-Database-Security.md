# Database Security

## 1. Introduction

Database security protects data and database systems from unauthorized access, modification, disclosure, and destruction.

Security is especially important for Data Engineers because pipelines often move sensitive information between multiple systems.

Sensitive data may include:

```text
Customer Information
Payment Information
Credentials
Vehicle Information
Location Data
Business Data
```

---

## 2. Main Security Goals

Database security commonly focuses on:

```text
Confidentiality
Integrity
Availability
```

### Confidentiality

Only authorized users can access data.

### Integrity

Data cannot be improperly modified.

### Availability

Authorized users can access systems when required.

---

## 3. Authentication

Authentication verifies who is connecting.

Examples:

```text
Username + Password
Certificates
Cloud Identity
Service Accounts
```

Example:

```text
Application
    |
    v
Authentication
    |
    v
Database
```

---

## 4. Authorization

Authorization determines what an authenticated user is allowed to do.

Example:

```text
Data Analyst
    |
    +--> SELECT

Data Engineer
    |
    +--> SELECT
    +--> INSERT
    +--> UPDATE

Database Administrator
    |
    +--> Administrative Operations
```

Users should receive only the permissions they need.

---

## 5. Principle of Least Privilege

A user or application should have the minimum permissions required for its task.

For example, an analytics application that only reads data should not have unrestricted write access.

```text
Analytics User
     |
     +--> SELECT
     |
     X--> DROP DATABASE
```

---

## 6. Roles

Databases can use roles to manage permissions.

Conceptually:

```text
Role
 |
 +-- SELECT
 +-- INSERT
 +-- UPDATE
```

Users can then be assigned appropriate roles.

The exact syntax varies by database.

---

## 7. SQL Injection

SQL injection occurs when untrusted input is incorrectly incorporated into SQL statements.

Unsafe pattern:

```text
User Input
    |
    v
String Concatenation
    |
    v
SQL Query
```

Applications should use parameterized queries or prepared statements.

Safe concept:

```text
User Input
    |
    v
Parameterized Query
    |
    v
Database
```

---

## 8. Encryption

Encryption protects data from unauthorized access.

Two important areas are:

```text
Encryption in Transit
Encryption at Rest
```

### In Transit

Protects data moving between systems.

```text
Application
   |
Encrypted Connection
   |
Database
```

### At Rest

Protects stored data.

```text
Database Storage
      |
Encryption
      |
Disk / Storage
```

---

## 9. Secrets Management

Never store credentials directly in source code.

Bad:

```python
password = "mypassword"
```

Use environment variables or secret management systems.

Example:

```text
Application
    |
    v
Secret Manager
    |
    v
Database Credential
```

---

## 10. Data Masking

Sensitive values can be masked for users who do not need the original data.

Example:

```text
Original:
9876543210

Masked:
******3210
```

This can be useful in development, testing, and analytics environments.

---

## 11. Auditing

Database auditing records important activities.

Example:

```text
User
 |
 v
Database
 |
 v
Audit Log
```

Possible events:

```text
Login
Data Access
Data Modification
Permission Changes
Schema Changes
```

---

## 12. Network Security

Databases should not be unnecessarily exposed to the public internet.

A typical architecture:

```text
Internet
   |
   v
Application
   |
Firewall / Private Network
   |
   v
Database
```

Cloud environments commonly provide private networking and security controls.

---

## 13. Automobile Example

Suppose an automobile company stores customer and vehicle information.

```text
Application
     |
     v
Authentication
     |
     v
Authorization
     |
     v
Database
     |
     +--> Customer Data
     +--> Vehicle Data
     +--> Sales Data
```

A Data Engineer should ensure that pipelines only access the data required for their jobs.

---

## 14. Security in Data Pipelines

A pipeline may look like:

```text
Source Database
      |
Encrypted Connection
      |
      v
Ingestion
      |
      v
Data Lake
      |
      v
Warehouse
```

Security should be applied throughout the pipeline.

---

## 15. Common Security Mistakes

Avoid:

```text
Hardcoded passwords
Public database exposure
Excessive permissions
Unencrypted connections
Shared user accounts
Secrets in Git
Unprotected backups
```

---

## 16. Best Practices

- Use strong authentication.
- Apply least privilege.
- Encrypt sensitive data.
- Protect credentials.
- Use secure connections.
- Monitor database access.
- Audit important operations.
- Secure backups.
- Regularly review permissions.

## Interview Questions

1. What is database security?
2. Authentication vs authorization?
3. What is least privilege?
4. What is SQL injection?
5. How can SQL injection be prevented?
6. Encryption at rest vs in transit?
7. Why should database credentials not be stored in Git?
8. What is database auditing?
9. How can Data Engineers secure pipeline connections?

## Summary

Database security protects data throughout its lifecycle. Authentication, authorization, encryption, secret management, auditing, and network controls are essential parts of a secure database architecture.