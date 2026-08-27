# Apache NiFi Operations Reference

NiFi startup and administration commands vary by version and deployment
method. Always check the official documentation for the installed release.

## Operational Checklist

```text
1. Check service status
2. Check UI availability
3. Check processor status
4. Inspect connection queues
5. Inspect backpressure
6. Review bulletins
7. Review logs
8. Inspect provenance
9. Check disk usage
10. Check cluster health
```

## Production Checklist

```text
Security
 ├── HTTPS
 ├── Authentication
 ├── Authorization
 └── Least privilege

Reliability
 ├── Backpressure
 ├── Retry strategy
 ├── Failure routing
 └── Monitoring

Operations
 ├── Version control
 ├── Documentation
 ├── Alerting
 └── Capacity planning
```

Do not blindly use commands from outdated tutorials because installation and
administration procedures can change between NiFi releases.
