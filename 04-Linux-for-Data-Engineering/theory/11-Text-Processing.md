# Linux Text Processing

## Introduction

Data Engineers frequently work with large text files such as CSV files, application logs, sensor data, and pipeline output.

Linux provides powerful command-line tools for inspecting and processing these files without opening them in a graphical application.

Common tools include:

- cat
- head
- tail
- wc
- sort
- uniq
- cut
- tr
- paste

These commands are especially useful when working with large datasets on remote servers.

---

## cat

`cat` displays file contents.

```bash
cat vehicle_logs.txt