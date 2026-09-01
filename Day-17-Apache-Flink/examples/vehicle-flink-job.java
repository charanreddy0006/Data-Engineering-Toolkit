package com.dataengineering.flink;

import org.apache.flink.streaming.api.datastream.DataStream;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;

public class VehicleFlinkJob {

    public static void main(String[] args) throws Exception {

        StreamExecutionEnvironment env =
                StreamExecutionEnvironment.getExecutionEnvironment();

        DataStream<String> telemetry = env.fromElements(
                "V001,72,91.2,61",
                "V002,105,96.4,44",
                "V001,118,103.5,42",
                "V003,85,89.4,72"
        );

        DataStream<String> validEvents = telemetry
                .filter(event -> !event.isBlank())
                .filter(event -> event.split(",").length == 4);

        DataStream<String> alerts = validEvents
                .filter(event -> {
                    String[] fields = event.split(",");
                    double speed = Double.parseDouble(fields[1]);
                    double temperature = Double.parseDouble(fields[2]);
                    return speed > 100 || temperature > 100;
                });

        alerts.print();

        env.execute("Vehicle Telemetry Alert Job");
    }
}
