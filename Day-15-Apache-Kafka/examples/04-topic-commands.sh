#!/usr/bin/env bash

BOOTSTRAP="localhost:9092"
TOPIC="vehicle.telemetry"

kafka-topics.sh   --bootstrap-server "$BOOTSTRAP"   --create   --topic "$TOPIC"   --partitions 3   --replication-factor 1

kafka-topics.sh   --bootstrap-server "$BOOTSTRAP"   --describe   --topic "$TOPIC"

kafka-topics.sh   --bootstrap-server "$BOOTSTRAP"   --list
