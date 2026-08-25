# Airflow Interview Questions

## Beginner

1. What is Airflow?
2. What is a DAG?
3. What is a task?
4. What is an operator?
5. What is a scheduler?
6. What is an executor?
7. What is XCom?
8. What is a sensor?

## Intermediate

9. Explain catchup and backfill.
10. Explain retries.
11. What are Connections and Variables?
12. What is TaskFlow?
13. What are trigger rules?
14. What is dynamic task mapping?
15. What are datasets?

## Advanced

16. How would you scale Airflow?
17. How do you secure production credentials?
18. How do you make a DAG idempotent?
19. Why should large datasets not use XCom?
20. How do you troubleshoot scheduler latency?

## Scenario

A vehicle-service load writes records and then a notification task fails. A
retry occurs. How do you prevent duplicate records?

Expected concepts: stable business key, staging, merge/upsert, idempotency and
separating data commit from notification failure.
