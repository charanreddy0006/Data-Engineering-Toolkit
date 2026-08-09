# Git Merge Conflicts

## 1. Introduction

A merge conflict occurs when Git cannot automatically combine changes from different branches.

Conflicts commonly happen when two branches modify the same lines of a file.

```text
main
 |
 A
 |
 B
 |\
 | \
 C  D
 |   |
 |   |
 +---+
 Conflict
```

## 2. Example

Suppose `main` contains:

```python
source = "vehicle_sales.csv"
```

A feature branch changes it to:

```python
source = "vehicle_sensor.csv"
```

Another branch changes the same line:

```python
source = "fleet_data.csv"
```

Git cannot automatically decide which version is correct.

## 3. Conflict Markers

Git may produce:

```text
<<<<<<< HEAD
source = "vehicle_sales.csv"
=======
source = "vehicle_sensor.csv"
>>>>>>> feature/vehicle-source
```

The sections represent conflicting versions.

## 4. Resolving a Conflict

First inspect:

```bash
git status
```

Open the affected file.

Choose the correct version.

Remove conflict markers:

```text
<<<<<<<
=======
>>>>>>>
```

Save the file.

## 5. Stage the Resolution

```bash
git add pipeline.py
```

Then complete the merge:

```bash
git commit
```

## 6. Conflict Workflow

```text
Merge
  |
  v
Conflict
  |
  v
git status
  |
  v
Open File
  |
  v
Resolve Changes
  |
  v
git add
  |
  v
git commit
```

## 7. Abort a Merge

If the conflict is difficult and you want to return to the previous state:

```bash
git merge --abort
```

## 8. Rebase Conflicts

Conflicts can also happen during rebase:

```bash
git rebase main
```

After resolving the conflict:

```bash
git add pipeline.py
```

Continue:

```bash
git rebase --continue
```

Abort:

```bash
git rebase --abort
```

## 9. Data Engineering Example

Suppose two engineers modify:

```text
vehicle_pipeline.sql
```

Engineer A changes:

```sql
SELECT vehicle_id, speed
FROM sensor_data;
```

Engineer B changes:

```sql
SELECT vehicle_id, battery_level
FROM sensor_data;
```

Git may require the team to decide whether the final query should contain:

```sql
SELECT vehicle_id, speed, battery_level
FROM sensor_data;
```

The correct resolution depends on the pipeline requirements.

## 10. Preventing Conflicts

Conflicts can be reduced by:

- Pulling changes regularly.
- Keeping branches short-lived.
- Communicating with teammates.
- Making focused commits.
- Avoiding unnecessary formatting changes.
- Dividing work across different files when possible.

## 11. Conflict Resolution Responsibility

Do not blindly choose:

```text
Accept Current
```

or:

```text
Accept Incoming
```

Understand the actual code and business/data requirements first.

## 12. Testing After Resolution

After resolving a conflict:

```bash
git status
```

Run tests:

```bash
pytest
```

Run pipeline validation:

```bash
python pipeline.py
```

For SQL changes, execute the relevant tests or validation queries.

## 13. Production Considerations

A conflict in a Data Engineering repository may involve:

- SQL transformations
- Schema definitions
- Airflow DAGs
- dbt models
- Docker configuration
- Infrastructure code

Incorrect conflict resolution can produce incorrect data.

## Best Practices

- Understand both changes.
- Resolve conflicts manually when necessary.
- Run tests after resolution.
- Never remove code simply to make Git accept the merge.
- Review the final diff.
- Communicate with the developer responsible for the conflicting change.

## Interview Questions

1. What is a merge conflict?
2. Why do merge conflicts occur?
3. How do you identify conflicted files?
4. What are Git conflict markers?
5. How do you abort a merge?
6. How do you continue a rebase after resolving a conflict?
7. Why can conflicts be dangerous in Data Engineering?

## Summary

Merge conflicts require developers to manually reconcile incompatible changes. In Data Engineering, careful conflict resolution is especially important because incorrect code can produce incorrect datasets or pipeline results.