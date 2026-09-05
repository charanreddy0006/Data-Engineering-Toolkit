# Pipeline Cheat Sheet

```text
Trigger
 ↓
Checkout
 ↓
Dependencies
 ↓
Lint
 ↓
Unit
 ↓
Integration
 ↓
Security
 ↓
Build
 ↓
Publish
 ↓
Staging
 ↓
Smoke/Data quality
 ↓
Approval
 ↓
Production
 ↓
Monitor
```

Ask:

- What triggers it?
- What artifact is produced?
- Where is it stored?
- Which credentials are used?
- How is production protected?
- How is rollback performed?
- How is data correctness verified?
