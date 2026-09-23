# 27. Error Handling

## Failure classes

### Transient
Retry may succeed.

### Data
Invalid source records.

### Code
Transformation bug.

### Dependency
Upstream failure.

### Configuration
Wrong environment or parameters.

## Record

- run ID
- task
- partition
- error type
- message
- timestamp

## Quarantine

Invalid records can sometimes be moved to a quarantine area so valid data can continue, depending on business requirements.

Do not hide errors merely to make a job show SUCCESS.
