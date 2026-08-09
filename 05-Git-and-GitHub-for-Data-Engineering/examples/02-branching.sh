#!/bin/bash

echo "Current Branch:"
git branch --show-current

echo
echo "All Local Branches:"
git branch

echo
echo "Create a feature branch:"
echo "git switch -c feature/vehicle-pipeline"

echo
echo "Switch back to main:"
echo "git switch main"