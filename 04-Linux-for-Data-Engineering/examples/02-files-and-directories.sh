#!/bin/bash

mkdir -p demo-data/raw
mkdir -p demo-data/processed
mkdir -p demo-data/archive

touch demo-data/raw/vehicles.csv

echo "Vehicle data created."

echo "Directory structure:"
find demo-data -type f -o -type d