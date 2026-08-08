#!/bin/bash

LOG_FILE="../datasets/cron-test.log"

echo "$(date) - Scheduled job executed" >> "$LOG_FILE"

echo "Cron example completed."