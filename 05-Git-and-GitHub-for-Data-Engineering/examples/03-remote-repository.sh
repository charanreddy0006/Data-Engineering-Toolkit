#!/bin/bash

echo "Remote Repository Commands"
echo "--------------------------"

echo
echo "List remotes:"
git remote -v

echo
echo "Add a remote:"
echo "git remote add origin <repository-url>"

echo
echo "Push main branch:"
echo "git push -u origin main"

echo
echo "Fetch remote changes:"
echo "git fetch origin"

echo
echo "Pull remote changes:"
echo "git pull origin main"