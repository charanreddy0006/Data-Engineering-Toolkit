import csv

total = 0

with open("vehicles.csv") as file:

    reader = csv.DictReader(file)

    for row in reader:

        total += int(row["Price"])

print("Total Sales :", total)