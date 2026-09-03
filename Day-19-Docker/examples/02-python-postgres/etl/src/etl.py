import os
import psycopg

config = {
    "host": os.environ["DB_HOST"],
    "port": os.environ["DB_PORT"],
    "dbname": os.environ["DB_NAME"],
    "user": os.environ["DB_USER"],
    "password": os.environ["DB_PASSWORD"],
}

rows = [
    ("VH1001", 72.0, 81.5),
    ("VH1002", 55.0, 67.2),
    ("VH1003", 91.0, 49.8),
]

with psycopg.connect(**config) as conn:
    with conn.cursor() as cur:
        for vehicle_id, speed, soc in rows:
            cur.execute(
                '''
                INSERT INTO vehicle_telemetry
                    (vehicle_id, speed_kmh, battery_soc)
                VALUES (%s, %s, %s)
                ''',
                (vehicle_id, speed, soc),
            )

    conn.commit()

print(f"Loaded {len(rows)} telemetry rows.")
