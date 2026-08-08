# Linux Processes

## Introduction

A process is a running instance of a program.

Whenever you execute a command, script, application, or Data Engineering pipeline, Linux creates a process.

Understanding processes is important for monitoring and troubleshooting production pipelines.

---

## Process ID

Every process has a unique Process ID, commonly called a PID.

List processes:

```bash
ps
```

Detailed process information:

```bash
ps aux
```

---

## top

`top` provides a real-time view of running processes.

```bash
top
```

It displays information such as:

- PID
- CPU usage
- Memory usage
- User
- Process status

---

## htop

`htop` provides a more interactive process viewer.

Install:

```bash
sudo apt install htop
```

Run:

```bash
htop
```

---

## Background Processes

A command can run in the background using `&`.

```bash
python pipeline.py &
```

Linux returns a process ID.

---

## jobs

Display jobs started from the current shell:

```bash
jobs
```

---

## fg

Bring a background job to the foreground:

```bash
fg
```

---

## kill

Terminate a process using its PID:

```bash
kill 1234
```

If necessary:

```bash
kill -9 1234
```

`kill -9` should be used carefully because it forcefully terminates the process.

---

## Process Signals

Common signals include:

| Signal | Meaning |
|---|---|
| SIGTERM | Request termination |
| SIGKILL | Force termination |
| SIGINT | Interrupt |
| SIGHUP | Hangup/reload |

---

## Process Monitoring

A Data Engineer might check:

```bash
ps aux | grep python
```

This can help identify running Python pipeline processes.

---

## Data Engineering Example

Imagine an ETL pipeline:

```text
Extract
   |
   v
Transform
   |
   v
Load
```

Each component may run as a process.

If the transformation process consumes too much memory, the engineer can investigate using:

```bash
top
```

or:

```bash
ps aux
```

---

## CPU and Memory

Processes can consume:

```text
CPU
Memory
Disk I/O
Network
```

A poorly optimized pipeline can consume excessive resources.

---

## Checking a Specific Process

```bash
ps -p 1234 -f
```

---

## Finding a Process

```bash
pgrep python
```

---

## Ending a Process

```bash
pkill python
```

Use process termination commands carefully, especially on production systems.

---

## 🚗 Automobile Example

Suppose a vehicle sensor ingestion service continuously processes incoming data:

```text
Vehicle Sensors
      |
      v
Ingestion Process
      |
      v
Raw Data
```

If ingestion stops, an engineer can check:

```bash
ps aux | grep ingestion
```

Then inspect logs and restart the service if required.

---

## Best Practices

- Monitor resource usage.
- Avoid killing production processes unnecessarily.
- Understand the PID before terminating a process.
- Use graceful termination where possible.
- Monitor long-running pipelines.

---

## Interview Questions

1. What is a process?
2. What is a PID?
3. Difference between `ps` and `top`?
4. What does `kill` do?
5. Difference between SIGTERM and SIGKILL?
6. How do you find a running Python process?

---

## Summary

Process management is essential for running and troubleshooting long-running Data Engineering applications and pipelines.