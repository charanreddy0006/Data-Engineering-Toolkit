# dbt CI/CD

A dbt Pull Request can run:

```text
dbt parse
 ↓
changed model build
 ↓
tests
 ↓
review
```

Validate:

- compilation,
- dependencies,
- not-null,
- uniqueness,
- accepted values,
- model behavior.

## Production

Record:

```text
Git commit
dbt version/project version
environment
```

CI should test transformations, not merely package the repository.
