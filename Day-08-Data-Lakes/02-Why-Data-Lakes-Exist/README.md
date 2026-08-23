# 02 — Why Data Lakes Exist

## Problems Before Data Lakes

Traditional architectures often required data to be transformed before storage.
This worked well for stable structured reporting but became difficult when data
volume and variety increased.

## Major Drivers

### 1. Data Volume

Organizations generate terabytes or petabytes of data.

### 2. Data Variety

Data can arrive as relational tables, JSON events, logs, documents, images,
and sensor streams.

### 3. Machine Learning

ML workloads often need raw historical data that was not originally included
in business reports.

### 4. Reprocessing

Keeping raw data allows teams to rebuild processed datasets when business rules
change.

## Centralized Model

```text
Application ----Database --------API --------------> Data Lake
IoT --------------/
Logs ------------/
```

## Business Example

An automobile company may receive vehicle telemetry every few seconds.
Deleting raw telemetry after producing a daily report prevents future analysis.

A lake can retain the source events while producing smaller curated datasets
for normal reporting.

## Key Idea

Store broadly, organize carefully, process according to use cases.
