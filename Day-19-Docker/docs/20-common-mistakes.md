# 20 — Common Docker Mistakes

## 1. localhost Between Containers

Wrong:

```text
DB_HOST=localhost
```

Correct:

```text
DB_HOST=postgres
```

## 2. No Database Volume

Recreating the database container can remove access to its old data if no persistent volume is used.

## 3. Secrets in Dockerfile

Bad:

```dockerfile
ENV PASSWORD=secret
```

Use proper secret management.

## 4. Huge Build Context

Use `.dockerignore`.

## 5. latest Everywhere

Use meaningful versioning.

## 6. Assuming depends_on Means Ready

Use health checks and application retries.

## 7. Deleting Volumes Carelessly

```bash
docker compose down -v
```

can remove persistent development data.

## 8. Thinking Every Exited Container Is Broken

Batch jobs normally exit after completion.

## 9. Hard-Coding IP Addresses

Use service names instead.

## 10. One Huge Image

Separate independent services.

## 11. Baking Production Data Into Images

Keep application artifacts separate from operational data.

## 12. Running Everything as Root

Use non-root execution where practical.

## 13. Debugging Without Logs

Start with:

```bash
docker ps -a
docker logs <container>
```

## 14. Infinite Retries

Permanent errors should not retry forever.

## 15. Thinking Docker Solves Everything

Docker does not solve:

- poor schemas
- bad ETL
- weak security
- poor observability
- bad data quality
