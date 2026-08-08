# Environment Variables

## Introduction

Environment variables are dynamic values stored by the operating system and made available to applications.

They are commonly used for configuration.

In Data Engineering, environment variables are especially useful for storing:

- Database configuration
- API endpoints
- Application settings
- Cloud configuration
- Credentials

---

## Viewing Environment Variables

Display all variables:

```bash
env
```

Display a specific variable:

```bash
echo $HOME
```

Another example:

```bash
echo $PATH
```

---

## Creating a Variable

```bash
DATA_SOURCE="vehicle_sensor.csv"
```

Access it:

```bash
echo $DATA_SOURCE
```

---

## export

To make a variable available to child processes:

```bash
export DATA_SOURCE="vehicle_sensor.csv"
```

Now programs launched from the shell can access it.

---

## PATH

`PATH` tells Linux where to look for executable programs.

Check it:

```bash
echo $PATH
```

It may contain directories such as:

```text
/usr/local/bin
/usr/bin
/bin
```

---

## Temporary Variables

A variable created in a shell session normally exists only for that session.

```bash
export ENVIRONMENT="development"
```

After closing the shell, it may disappear.

---

## Persistent Variables

Shell configuration files can be used to define variables.

For Bash:

```text
~/.bashrc
```

Example:

```bash
export PROJECT_ENV="development"
```

Then reload:

```bash
source ~/.bashrc
```

---

## Data Engineering Example

A pipeline should not hard-code configuration everywhere.

Instead of:

```python
database_host = "localhost"
```

configuration can come from the environment:

```text
DATABASE_HOST
DATABASE_NAME
DATABASE_USER
```

The application reads these values at runtime.

---

## Security

Avoid storing sensitive credentials directly in source code.

Bad:

```python
password = "my_secret_password"
```

Better:

```text
DATABASE_PASSWORD
```

The actual value can be provided securely through the environment or a secrets-management system.

---

## Multiple Environments

The same pipeline may run in:

```text
Development
      |
      v
Testing
      |
      v
Production
```

Environment variables can change configuration without changing the code.

Example:

```text
DATABASE_HOST=dev-db
```

versus:

```text
DATABASE_HOST=production-db
```

---

## 🚗 Automobile Example

A vehicle analytics pipeline might use:

```text
VEHICLE_DATA_PATH
DATABASE_HOST
DATABASE_NAME
PIPELINE_ENV
API_ENDPOINT
```

The same pipeline code can process different environments.

---

## Useful Commands

```bash
printenv
```

```bash
echo $HOME
```

```bash
echo $PATH
```

```bash
export PIPELINE_ENV="development"
```

```bash
unset PIPELINE_ENV
```

---

## Best Practices

- Never hard-code secrets.
- Use descriptive variable names.
- Separate configuration from code.
- Use different configurations for different environments.
- Protect sensitive environment variables.

---

## Interview Questions

1. What is an environment variable?
2. What is `PATH`?
3. Difference between `export` and a normal shell variable?
4. Why are environment variables useful in Data Engineering?
5. Why should credentials not be hard-coded?

---

## Summary

Environment variables provide flexible configuration and help Data Engineering applications run safely across development, testing, and production environments.