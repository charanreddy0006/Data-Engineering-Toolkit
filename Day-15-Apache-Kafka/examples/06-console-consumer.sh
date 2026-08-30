#!/usr/bin/env bash

kafka-console-consumer.sh   --bootstrap-server localhost:9092   --topic vehicle.telemetry   --from-beginning   --group vehicle-analytics
