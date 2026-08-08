#!/bin/bash

echo "Current processes:"
ps aux | head -10

echo
echo "Current shell PID:"
echo $$

echo
echo "Searching for Bash processes:"
pgrep bash || echo "No bash process found"