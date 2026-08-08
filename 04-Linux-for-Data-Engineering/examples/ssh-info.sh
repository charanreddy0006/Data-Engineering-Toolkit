#!/bin/bash

echo "SSH information example"

echo "Current user:"
whoami

echo
echo "Hostname:"
hostname

echo
echo "SSH directory:"
ls -la ~/.ssh 2>/dev/null || echo "SSH directory does not exist"