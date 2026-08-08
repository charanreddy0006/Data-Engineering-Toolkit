#!/bin/bash

FILE="../datasets/vehicles.csv"

echo "Electric Vehicles:"
grep "Electric" "$FILE"

echo
echo "Vehicle Brands:"
awk -F',' '{print $2}' "$FILE" | sort | uniq

echo
echo "Vehicles above 2,000,000:"
awk -F',' '$5 > 2000000 {print $0}' "$FILE"