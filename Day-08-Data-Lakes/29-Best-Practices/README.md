# 29 — Data Lake Best Practices

## Architecture

- Separate raw, processed, and curated data.
- Keep storage and compute loosely coupled.
- Design for replay.

## Data

- Use appropriate file formats.
- Define schemas.
- Validate data.
- Track metadata.

## Performance

- Partition carefully.
- Compact small files.
- Compress data.
- Use incremental processing.

## Security

- Least privilege.
- Encryption.
- Secret management.
- Audit access.

## Operations

- Monitor freshness.
- Alert on failures.
- Test recovery.
- Maintain runbooks.

## Governance

- Assign ownership.
- Maintain lineage.
- Define retention.
- Classify sensitive information.

## Development

- Version source code.
- Test transformations.
- Separate configuration.
- Avoid committing large generated datasets.
