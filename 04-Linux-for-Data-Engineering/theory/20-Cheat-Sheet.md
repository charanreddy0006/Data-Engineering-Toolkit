# Linux Cheat Sheet for Data Engineering

## Navigation

```bash
pwd
ls
ls -la
cd directory
cd ..
cd ~
```

## Files

```bash
touch file.txt
cat file.txt
head file.txt
tail file.txt
less file.txt
```

## Directories

```bash
mkdir data
mkdir -p data/raw
rmdir data
```

## Copy / Move / Delete

```bash
cp file backup/
cp -r source destination
mv old.txt new.txt
rm file.txt
rm -r directory
```

## File Information

```bash
file data.csv
wc -l data.csv
du -h data.csv
```

## Search

```bash
find . -name "*.csv"
grep "ERROR" pipeline.log
```

## Text Processing

```bash
head -10 data.csv
tail -10 data.csv
sort data.txt
sort data.txt | uniq
cut -d',' -f2 data.csv
```

## grep

```bash
grep "Electric" vehicles.csv
grep -i "error" pipeline.log
grep -c "ERROR" pipeline.log
```

## sed

```bash
sed 's/Petrol/Electric/g' vehicles.csv
```

## awk

```bash
awk -F',' '{print $2}' vehicles.csv
```

Filter:

```bash
awk -F',' '$5 > 2000000 {print $0}' vehicles.csv
```

## Pipes

```bash
cat vehicles.csv | head
```

```bash
cut -d',' -f2 vehicles.csv | sort | uniq
```

## Permissions

```bash
ls -l
chmod +x script.sh
chmod 755 script.sh
chmod 644 data.csv
chown user:group file
```

## Users

```bash
whoami
id
groups
sudo command
```

## Processes

```bash
ps
ps aux
top
pgrep python
kill PID
```

## Environment

```bash
env
echo $PATH
export ENV=development
unset ENV
```

## Packages

```bash
sudo apt update
sudo apt upgrade
sudo apt install package
sudo apt remove package
apt search package
```

## SSH

```bash
ssh user@server
ssh -p 2222 user@server
ssh-keygen -t ed25519
scp file user@server:/data/
```

## Cron

```bash
crontab -e
crontab -l
```

Every hour:

```text
0 * * * * /path/script.sh
```

Daily at 2 AM:

```text
0 2 * * * /path/script.sh
```

## Bash

```bash
#!/bin/bash

set -euo pipefail

echo "Hello"
```

Variable:

```bash
NAME="DataEngineer"
echo "$NAME"
```

Condition:

```bash
if [ -f "$FILE" ]; then
    echo "Exists"
fi
```

Loop:

```bash
for file in *.csv
do
    echo "$file"
done
```

## System Monitoring

```bash
df -h
free -h
uptime
top
```

## Data Engineering Pipeline

```text
Raw Data
   |
   v
Validation
   |
   v
grep / sed / awk
   |
   v
Processed Data
   |
   v
Database / Data Lake
```