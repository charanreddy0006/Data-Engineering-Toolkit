#!/bin/bash

export PIPELINE_ENV="development"
export DATA_SOURCE="vehicle_sensor.csv"

echo "Pipeline Environment: $PIPELINE_ENV"
echo "Data Source: $DATA_SOURCE"

echo
echo "PATH:"
echo "$PATH"