# Linux Interview Questions

## Beginner

1. What is Linux?
2. What is a Linux distribution?
3. What is the root directory?
4. What does `pwd` do?
5. What does `ls` do?
6. What does `cd` do?
7. What is the `/home` directory?
8. What is `/var/log` used for?
9. What is a process?
10. What is a PID?

## File Management

11. How do you create a file?
12. How do you create a directory?
13. Difference between `cp` and `mv`?
14. How do you delete a file?
15. How do you find a file?
16. What does `wc -l` do?
17. What does `head` do?
18. What does `tail -f` do?

## Permissions

19. What are Linux file permissions?
20. Explain read, write, and execute permissions.
21. What does `chmod 755` mean?
22. What does `chmod 644` mean?
23. What is `chown`?
24. Why should `chmod 777` generally be avoided?

## Processes

25. What is `ps`?
26. What is `top`?
27. What is `kill`?
28. Difference between SIGTERM and SIGKILL?
29. How do you find a running process?

## Text Processing

30. What is `grep`?
31. What is `sed`?
32. What is `awk`?
33. Difference between grep and awk?
34. What does a pipe do?
35. How can you extract a CSV column using `cut`?

## SSH

36. What is SSH?
37. What is the default SSH port?
38. What is an SSH key?
39. Difference between public and private keys?
40. What is `scp`?

## Automation

41. What is cron?
42. What is crontab?
43. How do you run a job every hour?
44. Why should cron scripts use absolute paths?
45. Cron vs Airflow?

## Bash

46. What is Bash?
47. What is a shebang?
48. How do you execute a Bash script?
49. What does `$1` represent?
50. What is an exit code?
51. What does `set -euo pipefail` do?

## Data Engineering

52. How is Linux used in Data Engineering?
53. How can Bash be used in ETL?
54. How would you process a large CSV without opening it in a GUI?
55. How would you monitor a failed pipeline?
56. Why are Linux skills important for cloud Data Engineers?

## Practical Questions

### Question 1

How would you find all CSV files?

```bash
find . -name "*.csv"
```

### Question 2

How would you find errors in a log?

```bash
grep "ERROR" pipeline.log
```

### Question 3

How would you count records?

```bash
wc -l vehicles.csv
```

### Question 4

How would you monitor a growing log?

```bash
tail -f pipeline.log
```

### Question 5

How would you make a script executable?

```bash
chmod +x pipeline.sh
```