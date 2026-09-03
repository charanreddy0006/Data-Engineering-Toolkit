import os
import sys

import psycopg


CONFIG = {
    "host": os.environ["DB_HOST"],
    "port": os.environ["DB_PORT"],
    "dbname": os.environ["DB_NAME"],
    "user": os.environ["DB_USER"],
    "password": os.environ["DB_PASSWORD"],
}


def run_checks():
    with psycopg.connect(**CONFIG) as conn:
        with conn.cursor() as cur:
            cur.execute(
                "SELECT COUNT(*) FROM vehicle_telemetry"
            )
            total = cur.fetchone()[0]

            cur.execute(
                '''
                SELECT COUNT(*)
                FROM vehicle_telemetry
                WHERE speed_kmh < 0
                   OR battery_soc < 0
                   OR battery_soc > 100
                '''
            )
            invalid = cur.fetchone()[0]

            cur.execute(
                '''
                SELECT COUNT(*)
                FROM vehicle_telemetry
                WHERE vehicle_id IS NULL
                   OR event_time IS NULL
                '''
            )
            missing = cur.fetchone()[0]

    print(f"Total rows: {total}")
    print(f"Invalid measurements: {invalid}")
    print(f"Missing required fields: {missing}")

    if invalid or missing:
        sys.exit(1)

    print("Data quality checks passed.")


if __name__ == "__main__":
    run_checks()
