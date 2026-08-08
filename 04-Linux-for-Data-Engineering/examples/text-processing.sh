#!/bin/bash

FILE="../datasets/vehicles.csv"

echo "First 5 records:"
head -5 "$FILE"

echo
echo "Total lines:"
wc -l "$FILE"

echo
echo "Vehicle brands:"
cut -d',' -f2 "$FILE" | sort | uniq