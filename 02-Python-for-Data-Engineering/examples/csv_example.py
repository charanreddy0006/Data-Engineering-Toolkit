"""
File: csv_example.py
"""

import csv

with open("vehicles.csv", "w", newline="") as file:

    writer = csv.writer(file)

    writer.writerow(["Brand", "Model", "Price"])
    writer.writerow(["Tata", "Nexon EV", 1700000])
    writer.writerow(["Hyundai", "Creta", 1850000])

with open("vehicles.csv") as file:

    reader = csv.reader(file)

    for row in reader:
        print(row)