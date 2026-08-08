#!/bin/bash

set -euo pipefail

INPUT="../datasets/vehicles.csv"
OUTPUT="../datasets/processed_vehicles.csv"

echo "Starting vehicle data pipeline..."

if [ ! -f "$INPUT" ]; then
    echo "ERROR: Input file not found."
    exit 1
fi

tail -n +2 "$INPUT" > "$OUTPUT"

echo "Input records:"
wc -l "$INPUT"

echo "Processed records:"
wc -l "$OUTPUT"

echo "Pipeline completed successfully."