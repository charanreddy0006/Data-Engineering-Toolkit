import csv
import os
from pathlib import Path

import psycopg


CONFIG = {
    "host": os.environ["DB_HOST"],
    "port": os.environ["DB_PORT"],
    "dbname": os.environ["DB_NAME"],
    "user": os.environ["DB_USER"],
    "password": os.environ["DB_PASSWORD"],
}

DATA_FILE = Path("/app/data/telemetry.csv")


def load_telemetry():
    with psycopg.connect(**CONFIG) as conn:
        with conn.cursor() as cur:
            with DATA_FILE.open(
                newline="",
                encoding="utf-8",
            ) as file:
                reader = csv.DictReader(file)
                count = 0

                for row in reader:
                    cur.execute(
                        '''
                        INSERT INTO vehicle_telemetry (
                            vehicle_id,
                            event_time,
                            speed_kmh,
                            battery_soc,
                            engine_temp_c,
                            latitude,
                            longitude
                        )
                        VALUES (%s, %s, %s, %s, %s, %s, %s)
                        ''',
                        (
                            row["vehicle_id"],
                            row["event_time"],
                            row["speed_kmh"],
                            row["battery_soc"],
                            row["engine_temp_c"],
                            row["latitude"],
                            row["longitude"],
                        ),
                    )

                    count += 1

        conn.commit()

    print(f"Loaded {count} telemetry rows.")


if __name__ == "__main__":
    load_telemetry()
