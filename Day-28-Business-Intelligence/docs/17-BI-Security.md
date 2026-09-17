# 17. BI Security

## Security Layers
1. Identity
2. Authentication
3. Authorization
4. Dataset permissions
5. Row-level security
6. Column/object security
7. Network controls
8. Audit logging

## Row-Level Security
RLS restricts rows according to the current user.

Example:
```text
Dealer Manager A → Dealer A rows
Dealer Manager B → Dealer B rows
National Analyst → All approved dealer rows
```

## Automobile Data
Customer identifiers, vehicle identifiers, location information and service history may require strict access controls.

## Security Principles
- Least privilege
- Need-to-know access
- Separate development and production
- Review access regularly
- Log sensitive-data access
- Avoid embedding secrets in reports

## Security Testing
Test both allowed and denied scenarios. A dashboard that looks correct for an administrator may still leak data to ordinary users.
